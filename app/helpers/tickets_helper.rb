module TicketsHelper
  public class Ticket
    attr_accessor :store_id, :store_name, :wait_number, :wait_ahead_count, :reg_time
  
    def initialize (attributes = {})
      @store_id = attributes[:store_id]
      @store_name = attributes[:store_name]
      @wait_number = attributes[:number]
      @wait_ahead_count = attributes[:wait_count]
      @reg_time = attributes[:reg_time]
    end
  end
end
