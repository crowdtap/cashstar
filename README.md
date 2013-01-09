# A CashStar Ruby Gem
A Ruby wrapper for the CashStar REST API

## <a name="installation">Installation</a>
    gem install cashstar

## <a name="Full API Docs">Full Documentation</a>
	please consult your CashStar API documentation for full use cases and support

## <a name="Notes">Current Limitations</a>
	as of v0.1.2, this gems supports json only and only one gift card is supported per order.

## <a name="examples">Usage Examples</a>
    require "cashstar"
   
	# Configure your CashStar settings - for Rails, typically in /config/initializers/cashstar.rb
	# Optionally, store your credentials for each environment in a cashstar.yml file and load from there.
	
	Cashstar.configure do |config|
	  config.username = 'username'
	  config.password = 'password'
	  config.endpoint = 'production or semi-production url'  
	  config.format = 'json' #or 'xml'
	end
	
	# Gift Card numbers are not returned by default - only urls to the hosted Gift Card and the associated challenge phrase
	# If you need the gift card number and pin, include the following in your config block:
	
	config.return_card_numbers = true

    # Get all merchants enabled for this account
    puts Cashstar.merchants

    # Get all faceplates for a merchant
    puts Cashstar.faceplates(:merchant_code)

	# Build an Order Entity
	# An order is composed of one or many gift card entities, which are in turn composed of delivery and message entities
	delivery = Cashstar::Client::Delivery.new(:delivered_by => :CLIENT) 
	message =  Cashstar::Client::Message.new(:body => 'Thanks for all the hard work!', :from => 'Santa Claus', :to => 'Rudolph')
	gift_card = Cashstar::Client::GiftCard.new(:merchant_code => 'GAP', :initial_balance => '100.00', :delivery => delivery, :message => message)
	order = Cashstar::Client::Order.new(:audit_number => '123456', :gift_card => gift_card) #Audit Number is required


	# Issue the built order
	puts Cashstar.issue(order)
   
