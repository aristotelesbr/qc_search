# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Questions::Searcheable::Flow do
  describe '#call!' do
    before do
      question1 = Question.create(statement: 'question1', text: 'any_text', answer: 'A', daily_access: 70, discipline: 'matemática')
      question2 = Question.create(statement: 'question2', text: 'any_text', answer: 'B', daily_access: 25, discipline: 'português')
      5.times do
        QuestionsAccess.create(
          date: '06-09-2020',
          times_accessed: rand(100..1000),
          question_id: [question1.id, question2.id].sample
        )
      end
    end

    let(:results) { Questions::Searcheable::Flow.call(terms) }

    context 'when search by date' do
      let(:terms) { { init_date: '06-09-2020' } }

      it { expect(results.success?).to be_truthy }

      it 'returns array of results' do
        expect(results.data[:result].size).not_to be_zero
      end

      it 'returns a question result' do
        expect(results.data[:result].first.is_a?(Question)).to be_truthy
      end

      it { expect(results.data[:result].first.attributes).to have_key('discipline') }

      it 'returns question per daily_access order' do
        first = results.data[:result].first.daily_access
        last = results.data[:result].last.daily_access

        expect(first > last).to be_truthy
      end
    end

    context 'when search by preriod' do
      let(:terms) { { init_date: '06-08-2020', end_date: '06-09-2020' } }

      it { expect(results.success?).to be_truthy }

      it 'returns array of results' do
        expect(results.data[:result].size).not_to be_zero
      end

      it 'returns a question result' do
        expect(results.data[:result].first.is_a?(Question)).to be_truthy
      end

      it { expect(results.data[:result].first.attributes).to have_key('discipline') }

      it 'returns question per daily_access order' do
        first = results.data[:result].first.daily_access
        last = results.data[:result].last.daily_access

        expect(first > last).to be_truthy
      end
    end
  end
end
