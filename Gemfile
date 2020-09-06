# frozen_string_literal: true

source 'http://rubygems.org'
# Sinatra is a DSL for quickly creating web applications in Ruby with minimal
# effort.
gem 'sinatra', '~> 2.1'
# A wonderfully simple way to load your code
gem 'require_all', '~> 2.0'
# Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server
# for Ruby/Rack applications. Puma is intended for use in both development and
# production environments. It's great for highly concurrent Ruby
# implementations such as Rubinius and JRuby as well as as providing process
# worker support to support CRuby well.
gem 'puma', '~> 4.3', '>= 4.3.5'

group :development, :test do
  # Meta package that requires several pry extensions.
  gem 'foreman', '0.87.1'
  # Process manager for applications with multiple components
  gem 'pry-meta'
end
