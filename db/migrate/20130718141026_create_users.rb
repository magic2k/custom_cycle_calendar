class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :rent_id
      t.boolean :admin, default: false
      t.string :remember_token

      t.timestamps
    end
    add_index :users, :name
    add_index :users, :remember_token
  end
end
