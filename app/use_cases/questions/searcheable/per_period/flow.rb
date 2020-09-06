# frozen_string_literal: true

module Questions
  module Searcheable
    module PerPeriod
      class Flow < Micro::Case
        def call!
          Success result: { result: 'PerPeriod' }
        end
      end
    end
  end
end
