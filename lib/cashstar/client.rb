module Cashstar
  # Wrapper for the CashStar REST API
  #
  # @note All methods have been separated into modules
  class Client < API
    # Require client method modules after initializing the Client class in
    # order to avoid a superclass mismatch error, allowing those modules to be
    # Client-namespaced.
    require 'cashstar/client/merchants'
    require 'cashstar/client/catalog'
    require 'cashstar/client/faceplates'
    require 'cashstar/client/order'
    require 'cashstar/client/gift_card'


    alias :api_endpoint :endpoint

    include Cashstar::Client::Merchants
    include Cashstar::Client::Faceplates
    include Cashstar::Client::Catalog
    include Cashstar::Client::OrderMethods
    include Cashstar::Client::GiftCardMethods          
  end
end
