class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true, index: true
      t.references :tweet, foreign_key: true, index: true
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
