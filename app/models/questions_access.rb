# frozen_string_literal: true

class QuestionsAccess < ActiveRecord::Base
  belongs_to :question
end
