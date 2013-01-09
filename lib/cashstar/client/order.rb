require 'hashie'


module Cashstar
  class Client
    module OrderMethods
      def issue(order)
        response = post("/v2/order/", order.to_json)
        format.to_s.downcase == 'xml' ? response['order'] : response['order']
      end
      
      def return(order)
        true
      end
    end
     
    # Defines methods related to a Cashstar Order
    class Order < Hashie::Dash
      property :audit_number, :required => true
      property :gift_card, :required => true
      property :payment, :default => nil
      
      def to_json()
        "{ \"order\" : { \"audit_number\" : \"#{self.audit_number}\", \"egc\" :  #{self.gift_card.to_json}}}"
      end
    end
    
    
  end
end      