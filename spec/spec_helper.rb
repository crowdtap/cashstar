require 'rubygems'
require 'bundler/setup'
require 'webmock/rspec'
require 'cashstar'

DEFAULT_OPTIONS = { :username => 'cashstars', :password => 'sekret', :endpoint => 'https://cashstar.example.com' }

def stub_get(endpoint, json_stub)
  body = load_fixture(json_stub)
  stub_request(:get, "https://cashstars:sekret@cashstar.example.com/#{endpoint}/").
    to_return(:status => 200, :body => body, :headers => {})
end

def load_fixture(file_name)
  file = File.open(File.join(Dir.pwd, 'spec', 'fixtures', "#{file_name}.json"))
  contents = file.read
  file.close
  contents
end
