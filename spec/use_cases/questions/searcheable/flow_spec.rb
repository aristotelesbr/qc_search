# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Questions::Searcheable::Flow do
  describe '#call!' do
    let(:results) { Questions::Searcheable::Flow.call(terms) }

    context 'when search by date' do
      let(:terms) { { init_date: '10-10-2019' } }

      it { expect(results.success?).to be_truthy }

      it 'returns LastDay string' do
        expect(results.data).to eq({ result: 'LastDay' })
      end
    end

    context 'when search by preriod' do
      let(:terms) { { init_date: '10-10-2019', end_date: '10-10-2019' } }

      it { expect(results.success?).to be_truthy }

      it 'returns PerPeriod string' do
        expect(results.data).to eq({ result: 'PerPeriod' })
      end
    end
  end
end
