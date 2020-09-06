# frozen_string_literal: true

module Questions
  module Searcheable
    module LastDay
      module Steps
        class Search < Micro::Case
          attributes :date, :cached

          def call!
            Success result: { result: 'LastDay' }
          end
        end
      end
    end
  end
end
