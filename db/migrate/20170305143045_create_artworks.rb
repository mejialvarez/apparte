class CreateArtworks < ActiveRecord::Migration[5.0]
  def change
    create_table :artworks do |t|
      t.references :user, foreign_key: true
      t.string :name, limit: 100, null: false
      t.string :description, limit: 500, null: false
      t.integer :price, limit: 8, null: false
      t.integer :score

      t.timestamps
    end
  end
end
