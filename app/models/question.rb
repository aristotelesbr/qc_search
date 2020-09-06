# frozen_string_literal: true

# Question entity
class Question < ActiveRecord::Base
  include QuesitonSearchable
end
