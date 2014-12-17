json.array!(@stores) do |store|
  json.extract! store, :id, :name, :category, :tel, :addr, :location, :cnt, :wait
end