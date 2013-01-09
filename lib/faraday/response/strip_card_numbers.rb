require 'faraday'

module Faraday
  class Response::StripCardNumbers < Response::Middleware
    
    def parse(body)
      if body
        if body["egc"]
          body["egc"].delete("egc_number")
          body["egc"].delete("access_code")
        end
        if body["order"] and body["order"]["egc"]
          body["order"]["egc"].delete("egc_number")
          body["order"]["egc"].delete("access_code")
        end
      end
      body
    end
  end
end