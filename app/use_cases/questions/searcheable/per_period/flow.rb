# frozen_string_literal: true

module Questions
  module Searcheable
    module PerPeriod
      class Flow < Micro::Case
        attributes :init_date, :end_date

        def call!
          Success result: { result: query(init_date, end_date) }
        end

        private

        def query(srt_init_date, srt_end_date)
          questions_ids = QuestionsAccess.search(
            load: false,
            where: { date: srt_init_date.to_date..srt_end_date.to_date },
            order: { times_accessed: :desc },
            page: 1,
            per_page: 100
          ).results.pluck('question_id')

          perform(questions_ids)
        end

        def perform(ids)
          Question.where(id: ids).order(daily_access: :desc)
        end
      end
    end
  end
end
