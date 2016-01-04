# tpaga-ruby-website-demo
TPAGA RUBY WEBSITE DEMO

For testing purposes, this demo uses the API key token "d13fr8n7vhvkuch3lq2ds5qhjnd2pdd2" in the Tpaga sandbox environment. You also can create a Tpaga account at https://sandbox.tpaga.co and change API credentials in the charge function at app/controllers/tpaga_charge_controller.rb

```ruby
class TpagaChargeController < ApplicationController
  
  ...

  def charge

    Tpaga::Swagger.configure do |config|
      config.api_key = 'd13fr8n7vhvkuch3lq2ds5qhjnd2pdd2'
  end
```
## Requirements

Ruby on rails quirements.


## Getting Started

Download the package and install all its dependencies. First, install bundler to manage the project's dependencies: 

```bash
$ gem install bundler
```

Then, install dependencies by typing this line in the project path:

```bash
$ bundler install
```

Finally, run the server:

```bash
$ rails s
```

## What to expect?

You will see a website from a rapid food place where you can chose among three combo options. After that, you can insert your credit card information and pay for your selection.

![Rubyweb](/Rubyweb.png)

## What does the application do?

This demo takes your credit card information and creates a customer, assigns a credit card to that customer and performs a charge to that card in the Tpaga sandbox environment. If you get a successfull transaction you will see the description of your purchase and the transaction id.

## Documentation

Please see https://tpaga.com/docs for extra documentation.