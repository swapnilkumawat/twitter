class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :avatar
      t.string :password_digest
      t.text :bio

      t.timestamps
    end
  end
end
