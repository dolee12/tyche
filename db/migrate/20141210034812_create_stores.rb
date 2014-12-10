class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :reg_no
      t.string :name
      t.string :addr
      t.string :location
      t.string :tel
      t.time :open_time
      t.time :close_time

      t.timestamps
    end
  end
end
