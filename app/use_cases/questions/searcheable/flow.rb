# frozen_string_literal: true

require_relative './steps/resolve_params'

module Questions
  module Searcheable
    class Flow < Micro::Case
      flow Steps::ResolveParams
    end
  end
end
