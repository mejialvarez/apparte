class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :talk, foreign_key: true
      t.references :user, foreign_key: true
      t.string :body, limit: 140, null:false

      t.timestamps
    end
  end
end
