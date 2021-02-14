class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, foreign_key: true, index: true
      t.references :tweet, foreign_key: true, index: true

      t.timestamps
    end
  end
end
