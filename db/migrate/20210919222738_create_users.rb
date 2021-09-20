class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :password_digest
      t.boolean :etd
      t.boolean :sme
      t.boolean :editor
      t.boolean :tester

      t.timestamps
    end
  end
end
