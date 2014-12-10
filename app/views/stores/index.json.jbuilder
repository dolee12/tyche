json.array!(@stores) do |store|
  json.extract! store, :id, :reg_no, :name, :addr, :location, :tel, :open_time, :close_time
  json.url store_url(store, format: :json)
end
