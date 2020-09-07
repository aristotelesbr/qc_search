# frozen_string_literal: true

module Questions
  module Searcheable
    module LastDay
      module Steps
        class Search < Micro::Case
          attributes :date, :cached_data

          def call!
            return Success result: { result: cached_data } if cached?

            Success result: { result: query(date) }
          end

          private

          def query(srt_date)
            questions_ids = QuestionsAccess.search(
              load: false,
              where: { date: srt_date.to_date },
              order: { times_accessed: :desc },
              page: 1,
              per_page: 100
            ).results.pluck('question_id')

            perform(questions_ids)
          end

          def perform(ids)
            Question.where(id: ids).order(daily_access: :desc)
          end

          def cached?
            cached_data.present?
          end
        end
      end
    end
  end
end
