class AddAnswersToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :answer_1_text, :string
    add_column :questions, :answer_2_text, :string
    add_column :questions, :answer_3_text, :string
    add_column :questions, :answer_4_text, :string
    add_column :questions, :answer_5_text, :string
    add_column :questions, :answer_6_text, :string
    add_column :questions, :answer_7_text, :string
  end
end
