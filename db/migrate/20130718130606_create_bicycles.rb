class CreateBicycles < ActiveRecord::Migration
  def change
    create_table :bicycles do |t|
      t.string :name
      t.binary :avatar

      t.timestamps
    end
    add_index :bicycles, :name
  end
end
