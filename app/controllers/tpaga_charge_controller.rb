require 'tpaga'


class TpagaChargeController < ApplicationController
  layout "default"
  def index



  end

  def charge

  	Tpaga::Swagger.configure do |config|
  		config.api_key = 'd13fr8n7vhvkuch3lq2ds5qhjnd2pdd2'
	end

  	@products = params['products']
  	@description = " " 
  	@amount = 0
  	@products.each do |product|

	    @description = @description + " " + product
	    if product.downcase == "combo 1"
	        @amount += 3000 
        end  	   
	    if product.downcase == "combo 2"
	        @amount += 4500   
	    end
	    if product.downcase == "combo 3"
	        @amount += 2800 
	    end 
  
    end
    @taxamount = @amount*0.1

   	createCustomer
   	if !@customer.nil?
		createCreditCard
		if !@card.nil?
			chargeCreditCard
		end
	end
  end


#TPAGA functionalities

  def createCustomer

	customer_local = Tpaga::Customer.new(
		firstName: params[:firstname],
		lastName: params[:lastname],
		email: "customer@mail.com",
		phone: "0000000000",
		gender: "M"
	)
	begin  

		@customer = Tpaga::CustomerApi.create_customer(customer_local)

	rescue Exception => e  
  		@error = e.message 
  	end
  end


  def createCreditCard

  	duedate = params[:duedate]

  	card_local = Tpaga::CreditCardCreate.new(
        primaryAccountNumber: params[:cardnumber].gsub(" ", ""),
        expirationMonth: duedate[0..1],
        expirationYear: duedate[5..-1],
        cardVerificationCode: params[:securitycode],
        cardHolderName: params[:firstname] + params[:lastname],
        billingAddress: Tpaga::BillingAddress.new
    )

    begin
	    @card = Tpaga::CreditCardApi.add_credit_card(@customer.id, card_local)
 	rescue Exception => e  
  		@error = e.message 
  	end

  end

  def chargeCreditCard

  	charge_local = Tpaga::CreditCardCharge.new(
        amount: @amount,
        taxAmount: @taxamount,
        currency: "COP",
        orderId: "order id",
        installments: params[:installments],
        description: @description,
        creditCard: @card.id
    )
    begin
	    @charge = Tpaga::ChargeApi.add_credit_card_charge(charge_local)
	rescue Exception => e  
  		@error = e.message 
  	end

  end  


end
