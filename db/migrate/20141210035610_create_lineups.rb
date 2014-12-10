class CreateLineups < ActiveRecord::Migration
  def change
    create_table :lineups do |t|
      t.integer :user_id
      t.integer :store_id
      t.integer :number
      t.integer :person_cnt
      t.datetime :check_in

      t.timestamps
    end
  end
end
