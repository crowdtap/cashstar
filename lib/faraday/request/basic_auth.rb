require 'faraday'

module Faraday
  class Request::BasicAuth < Faraday::Middleware
    require 'base64'

    def call(env)
      header = Base64.encode64("#{@options[:username]}:#{@options[:password]}")
      env[:request_headers]['Authorization'] = "Basic #{header.to_s}"
      @app.call(env)
    end

    def initialize(app, options)
      @app, @options = app, options
    end
  end
end
