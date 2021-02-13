class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.text :content
      t.integer :parent_id
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end

    add_index :tweets, :parent_id
  end
end
