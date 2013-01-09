require 'cashstar/authentication'
require 'cashstar/configuration'
require 'cashstar/connection'
require 'cashstar/request'

module Cashstar
  # @private
  class API
    include Connection
    include Request
    include Authentication

    # @private
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # Creates a new API
    def initialize(options={})
      options = Cashstar.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
  end
end
