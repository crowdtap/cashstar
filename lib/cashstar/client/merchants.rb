module Cashstar
  class Client
    # Defines methods related to Cashstar merchants
    module Merchants

      def merchants
        response = get("/v2/merchant/")
        format.to_s.downcase == 'xml' ? response['merchant'] : response['merchants']['merchant']
      end

    end
  end
end
