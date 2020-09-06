# frozen_string_literal: true

module Questions
  module Searcheable
    module LastDay
      module Steps
        class CachedFind < Micro::Case
          attributes :date

          def call!
            Success result: { cache: true, date: date }
          end
        end
      end
    end
  end
end
