class CreateTalks < ActiveRecord::Migration[5.0]
  def change
    create_table :talks do |t|
      t.references :user, foreign_key: true
      t.references :artwork, foreign_key: true
      t.integer :status, default: 0, null: false

      t.timestamps
    end
    add_index :talks, [:user_id, :artwork_id], unique: true
  end
end
