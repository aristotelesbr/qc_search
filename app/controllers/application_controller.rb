# frozen_string_literal: true

# Base controller
class ApplicationController < Sinatra::Base
  get '/' do
    { hello: 'world' }.to_json
  end
end
