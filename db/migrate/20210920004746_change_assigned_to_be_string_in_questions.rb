class ChangeAssignedToBeStringInQuestions < ActiveRecord::Migration[5.1]
  def change
    change_column :questions, :assigned, :integer
  end
end
