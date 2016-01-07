# tpaga-ruby-website-demo
TPAGA RUBY WEBSITE DEMO

For testing purposes, this demo uses the API key token "d13fr8n7vhvkuch3lq2ds5qhjnd2pdd2" in the Tpaga sandbox environment. You also can create a Tpaga account at https://sandbox.tpaga.co and change API credentials in the test environment at config/environments/test.rb

```ruby
...

config.tpaga_api_key = 'd13fr8n7vhvkuch3lq2ds5qhjnd2pdd2'

```
## Requirements

* Ruby on rails quirements.
* Postgresql.


## Getting Started

Download the package and install all its dependencies. First, install bundler to manage the project's dependencies: 

```bash
$ gem install bundler
```

Then, install dependencies by typing this line in the project path:

```bash
$ bundle install
```

Finally, run the server and look for http://localhost:xxxx/tpaga_charge/index in your browser:

```bash
$ rails s
```

## What to expect?

You will see a website from a rapid food place where you can chose among three combo options. After that, you can insert your credit card information and pay for your selection.

![Rubyweb](/Rubyweb.png)

## What does the application do?

This demo takes your credit card information and creates a customer, assigns a credit card to that customer and performs a charge to that card in the Tpaga sandbox environment. If you get a successfull transaction you will see the description of your purchase and the transaction id.

## Production environment

If you want to use this application with production configuration, you must set an environment variable called *TPAGA_API_KEY*. To do that you can follow the next steps:

* Add figaro to the gemfile and install it using bundler

```rails
	gem 'figaro' 
```

```bash
	$ bundle install 
```
	
* The gem provides a generator that creates a config/application.yml file and modifies the .gitignore file to prevent the file from being checked into a git repository.

```bash
	$ bundle exec figaro install
```

* Add the environment variable as key/value pair to config/application.yml:

```rails
TPAGA_API_KEY: 'your_api_key'
```

## Documentation

Please see https://tpaga.com/docs for extra documentation.

## License

This is an open-sourced software licensed under the [Apache license, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).
