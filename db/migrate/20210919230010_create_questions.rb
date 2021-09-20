class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question_text
      t.boolean :answer_1
      t.boolean :answer_2
      t.boolean :answer_3
      t.boolean :answer_4
      t.boolean :answer_5
      t.boolean :answer_6
      t.boolean :answer_7
      t.text :answers
      t.text :comments

      t.timestamps
    end
  end
end
