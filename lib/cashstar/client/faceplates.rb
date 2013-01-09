module Cashstar
  class Client
    # Defines methods related to a Cashstar Order
    module Faceplates
      
      def faceplates(merchant_code)
        response = get("/v2/merchant/#{merchant_code}/faceplate/")
        format.to_s.downcase == 'xml' ? response['merchant'] : response['faceplates']['faceplate']
      end
    
  
    end
  end
end