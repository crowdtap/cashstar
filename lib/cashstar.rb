require 'cashstar/api'
require 'cashstar/client'
require 'cashstar/configuration'
require 'cashstar/error'


module Cashstar
  extend Configuration
  class << self
    # Alias for Cashstar::Client.new
    #
    # @return [Cashstar::Client]
    def new(options={})
      Cashstar::Client.new(options)
    end

    # Delegate to Cashstar::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
