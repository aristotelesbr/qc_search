# frozen_string_literal: true

namespace :app do
  desc 'Allow console to have access to Models and Database'
  task :console do
    Pry.start
  end
end
