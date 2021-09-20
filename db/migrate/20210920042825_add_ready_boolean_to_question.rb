class AddReadyBooleanToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :ready, :boolean, default: false
  end
end
