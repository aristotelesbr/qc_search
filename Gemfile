# frozen_string_literal: true

source 'http://rubygems.org'
# Sinatra is a DSL for quickly creating web applications in Ruby with minimal
# effort.
gem 'sinatra', '~> 2.1'
# A wonderfully simple way to load your code
# Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/]
gem 'pg', '~> 1.2', '>= 1.2.3'
# Rake is a Make-like program implemented in Ruby. Tasks and dependencies are
# specified in standard Ruby syntax
gem 'rake', '~> 13.0', '>= 13.0.1'
# Databases on Rails. Build a persistent domain model by mapping database
# tables to Ruby classes. Strong conventions for associations, validations,
# aggregations, migrations, and testing come baked-in.
gem 'activerecord', '~> 6.0', '>= 6.0.3.2'
# Extends Sinatra with ActiveRecord helpers.
gem 'sinatra-activerecord', '~> 2.0', '>= 2.0.18'
# A wonderfully simple way to load your code
gem 'require_all', '~> 2.0'
# Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server
# for Ruby/Rack applications. Puma is intended for use in both development and
# production environments. It's great for highly concurrent Ruby
# implementations such as Rubinius and JRuby as well as as providing process
# worker support to support CRuby well.
gem 'puma', '~> 4.3', '>= 4.3.5'
# Intelligent search made easy with Rails and Elasticsearch
gem 'searchkick', '~> 4.4', '>= 4.4.1'
# Represent use cases in a simple and powerful way while writing modular,
# expressive and sequentially logical code.
gem 'u-case', '~> 4.0'

group :development, :test do
  # Meta package that requires several pry extensions.
  gem 'foreman', '0.87.1'
  # Process manager for applications with multiple components
  gem 'pry-meta'
  # BDD for Ruby
  gem 'rspec', '~> 3.9'
end
