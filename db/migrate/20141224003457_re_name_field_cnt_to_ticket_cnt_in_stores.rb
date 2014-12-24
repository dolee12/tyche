class ReNameFieldCntToTicketCntInStores < ActiveRecord::Migration
  def change
	rename_column :stores, :cnt, :ticket_cnt
	remove_column :stores, :wait
  end
end
