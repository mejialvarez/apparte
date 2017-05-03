class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :votable, polymorphic: true, index: true
      t.references :user, index: true, foreign_key: true
      t.integer    :score, default: 0, null: false

      t.timestamps null: false
    end
  end
end
