# frozen_string_literal: true

class CreateQuestionsAccesses < ActiveRecord::Migration[6.0]
  def change
    create_table :questions_accesses do |t|
      t.datetime :date, null: false
      t.integer :times_accessed, default: 0
      t.references :question, index: true
    end
  end
end
