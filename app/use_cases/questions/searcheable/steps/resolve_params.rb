# frozen_string_literal: true

module Questions
  module Searcheable
    module Steps
      class ResolveParams < Micro::Case
        attributes :init_date, :end_date, default: Time.now

        def call!
          Success result: { term: [init_date, end_date] }
        end
      end
    end
  end
end
