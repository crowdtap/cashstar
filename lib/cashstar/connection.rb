require 'faraday_middleware'
require 'faraday/request/gateway'
require 'faraday/request/basic_auth'
require 'faraday/response/raise_http_4xx'
require 'faraday/response/raise_http_5xx'
require 'faraday/response/strip_card_numbers'

module Cashstar
  # @private
  module Connection
    private

    def connection(options={})
      merged_options = faraday_options.merge({
        :headers => {
          'Accept'       => "application/json",
          'User-Agent'   => user_agent,
          'Content-Type' => "application/json"
        },
        :ssl => {:verify => false},
        :url => options.fetch(:endpoint, api_endpoint)
      })

      Faraday.new(merged_options) do |builder|
        builder.use Faraday::Request::BasicAuth, authentication if authenticated?
        builder.use Faraday::Request::UrlEncoded
        builder.use Faraday::Response::RaiseHttp4xx
        unless return_card_numbers
          builder.use Faraday::Response::StripCardNumbers 
        end
        unless options[:raw]
          case options.fetch(:format, format).to_s.downcase
          when 'json'
            builder.use Faraday::Response::Mashify
            builder.use Faraday::Response::ParseJson
          when 'xml'
            builder.use Faraday::Response::Mashify
            builder.use Faraday::Response::ParseXml
          end
        end
        builder.use Faraday::Response::RaiseHttp5xx
        builder.adapter(adapter)
      end
    end
  end
end
