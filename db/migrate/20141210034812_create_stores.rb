class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :reg_no, :limit => 12, :null => false
      t.string :name, :limit => 100, :null => false
      t.string :addr, :null => true
      t.string :location, :null => true
      t.string :tel, :limit => 20, :null => true
      t.time :open_time, :null => true
      t.time :close_time, :null => true
      t.boolean :wait, :null => false, :default => false
      t.integer :cnt, :null => false, :default => 0

      t.timestamps
    end
  end
end
