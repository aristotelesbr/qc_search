# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Questions::Searcheable::Flow do
  describe '#call!' do
    let(:terms) { { init_date: '12-02-2019', end_date: '13-03-2019' } }
    let(:results) { Questions::Searcheable::Flow.call(terms) }

    context 'when return valid results' do
      it { expect(results.success?).to be_truthy }
    end
  end
end
