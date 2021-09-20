class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :answer_1_text
      t.string :answer_2_text
      t.string :answer_3_text
      t.string :answer_4_text
      t.string :answer_5_text
      t.string :answer_6_text
      t.string :answer_7_text
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
