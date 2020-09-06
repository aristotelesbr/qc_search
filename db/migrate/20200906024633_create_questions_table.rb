# frozen_string_literal: true

class CreateQuestionsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :statement, null: false, default: ''
      t.text :text, null: false
      t.string :answer, null: false
      t.integer :daily_access, default: 0
      t.string :discipline, null: false

      t.timestamps
    end
  end
end
