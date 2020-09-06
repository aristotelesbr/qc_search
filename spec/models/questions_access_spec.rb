# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe QuestionsAccess, type: :model do
  it 'is valid with valid attributes' do
    expect(QuestionsAccess.new).to be_valid
  end
end
