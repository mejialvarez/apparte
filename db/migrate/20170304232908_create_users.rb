class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :full_name, limit: 100, null: false
      t.string :email, limit: 100, null: false
      t.integer :phone, limit: 8
      t.integer :role, default: 0, null: false

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
