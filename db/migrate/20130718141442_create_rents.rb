class CreateRents < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      t.datetime :date
      t.integer :renter_id
      t.integer :bicycle_id

      t.timestamps
    end
    add_index :rents, [:bicycle_id, :date], unique: true
  end
end
