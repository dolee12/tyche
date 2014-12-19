json.array!(@tickets) do |ticket|
  json.extract! ticket, :store_id, :store_name, :wait_number, :wait_ahead_count, :reg_time
end
