# frozen_string_literal: true

module QuestionsAccessSearchable
  extend ActiveSupport::Concern

  included do
    searchkick

    def search_data
      {
        id: id,
        times_accessed: times_accessed,
        question_id: question_id,
        date: date.to_time
      }
    end
  end
end
