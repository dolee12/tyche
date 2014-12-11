class CreateLineups < ActiveRecord::Migration
  def change
    create_table :lineups do |t|
      t.belongs_to :user, :null => false
      t.belongs_to :store, :null => false
      t.integer :cnt, :null => false
      t.integer :person_cnt, :null => false, :default => 1
      t.datetime :check_in, :null => true

      t.timestamps
    end
  end
end
