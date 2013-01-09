require 'hashie'

module Cashstar
  class Client
    module GiftCardMethods
      def balance_inquiry(merchant, egc_code)
        response = get("/v2/merchant/#{merchant}/egc/#{egc_code}/balance/")
        format.to_s.downcase == 'xml' ? response['egc'] : response['egc']
      end
      
      def cancel(merchant, egc_code)
        response = delete("/v2/merchant/#{merchant}/egc/#{egc_code}/")
        format.to_s.downcase == 'xml' ? response['egc'] : response['egc']
      end
    end
    
    # Defines methods related to a Cashstar Order
    class GiftCard < Hashie::Dash
      property :merchant_code, :required => true
      property :initial_balance, :required => true
      property :currency, :default => 'USD'
      property :challenge
      property :challenge_description
      property :delivery
      property :message
    end
    
    class Delivery < Hashie::Dash
      property :delivered_by, :default => 'CASHSTAR'
      property :method
      property :target
      property :scheduled
    end
    
    class Message < Hashie::Dash
      property :from
      property :to
      property :body
    end
  end
end