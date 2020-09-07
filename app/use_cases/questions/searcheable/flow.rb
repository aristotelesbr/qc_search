# frozen_string_literal: true

require_rel './last_day/flow'
require_rel './per_period/flow'

module Questions
  module Searcheable
    class Flow < Micro::Case
      attributes :init_date, :end_date, default: Time.now

      def call!
        result = if init_date.is_a?(String) && end_date.is_a?(String)
                   search_by_per_period(init_date, end_date)
                 else
                   search_by_last_day(init_date)
                 end
        return errors(result.data) unless result.success?

        Success result: { result: result.data[:result] }
      end

      private

      def errors(err)
        Failure result: { errors: err }
      end

      def search_by_per_period(start, finish)
        Questions::Searcheable::PerPeriod::Flow.call(
          init_date: start, end_date: finish
        )
      end

      def search_by_last_day(date)
        Questions::Searcheable::LastDay::Flow.call(
          date: date
        )
      end
    end
  end
end
