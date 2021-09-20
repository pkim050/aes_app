class AddCompletedBooleanToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :completed, :boolean, default: false
  end
end
