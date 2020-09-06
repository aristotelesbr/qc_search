# frozen_string_literal: true

require_rel './steps/cached_find'
require_rel './steps/search'

module Questions
  module Searcheable
    module LastDay
      class Flow < Micro::Case
        flow Steps::CachedFind,
             Steps::Search
      end
    end
  end
end
