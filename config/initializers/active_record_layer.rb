# frozen_string_literal: true

set :database_file, 'database.yml'

configure :production, :development do
  db = URI.parse(ENV['DATABASE_URL'] || "postgres://#{ENV['POSTGRES_USER']}:#{ENV['POSTGRES_PASSWORD']}@#{ENV['POSTGRES_DB']}/#{ENV['POSTGRES_DATABASE_NAME']}")

  ActiveRecord::Base.establish_connection(
    adapter: db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    host: db.host,
    username: db.user,
    password: db.password,
    database: db.path[1..-1],
    encoding: 'utf8'
  )
end

configure :test do
  db = URI.parse(ENV['DATABASE_URL'] || "postgres://#{ENV['POSTGRES_USER']}:#{ENV['POSTGRES_PASSWORD']}@#{ENV['POSTGRES_DB']}/qc_search_test")

  ActiveRecord::Base.establish_connection(
    adapter: db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    host: db.host,
    username: db.user,
    password: db.password,
    database: db.path[1..-1],
    encoding: 'utf8'
  )
end
