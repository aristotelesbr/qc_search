# frozen_string_literal: true

class QuestionsAccess < ActiveRecord::Base
  include QuestionsAccessSearchable

  belongs_to :question
end
