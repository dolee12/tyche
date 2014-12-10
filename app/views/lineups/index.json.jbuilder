json.array!(@lineups) do |lineup|
  json.extract! lineup, :id, :user_id, :store_id, :number, :person_cnt, :check_in
  json.url lineup_url(lineup, format: :json)
end
