class ChangeTableNameForLineups < ActiveRecord::Migration
  def change
    rename_table :lineups, :tickets
  end
end
