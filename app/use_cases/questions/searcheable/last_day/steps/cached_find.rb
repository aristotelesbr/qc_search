# frozen_string_literal: true

module Questions
  module Searcheable
    module LastDay
      module Steps
        class CachedFind < Micro::Case
          attributes :date

          def call!
            Success result: { date: date, cached_data: [] }
          end
        end
      end
    end
  end
end
