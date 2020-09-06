# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe Question, type: :model do
  it 'is valid with valid attributes' do
    expect(Question.new).to be_valid
  end
end
