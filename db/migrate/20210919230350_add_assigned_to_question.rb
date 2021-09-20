class AddAssignedToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :assigned, :boolean
  end
end
