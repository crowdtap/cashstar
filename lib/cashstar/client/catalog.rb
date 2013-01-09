module Cashstar
  class Client
    # Defines methods related to a Cashstar Order
    module Catalog
      
      def catalog(merchant_code)
        response = get("/v2/merchant/#{merchant_code}/catalog/")
        format.to_s.downcase == 'xml' ? response['catalog'] : response['catalog']
      end
    end
  end
end