# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# generate users
(1..100).each do |i|
  p = User.new
  p.name ="홍길동" + i.to_s
  p.phone = "010-2763-1788"
  p.save
end

store_list = [["김밥천국","음식점"], 
        ["놀부부대","음식점"], 
        ["하동관", "음식점"], 
        ["섬낙지","음식점"],
        ["오양족발", "음식점"], 
        ["명동칼국수", "음식점"],
        ["이진영피부과", "병원"],
        ["김사랑치과", "병원"],
        ["연세이비인후과", "병원"],
        ["경희한의원", "병원"]
      ]

store_list.each do |i|
  s = Store.new
  s.reg_no = "111-22-33445"
  s.name = i[0]
  s.category = i[1]
  s.addr = "서울시 강남구 대치2동 포스코 지하 1층"
  s.location ="1111111"
  s.tel = "02-3412-7642"
  s.open_time = "10:00"
  s.close_time = "22:00"
  s.wait = false
  s.cnt = 1
  s.save!
end

r = Random.new
hash = {}
users = User.all

users.each do |eachUser|
  (1..3).each do |i|
    store_id = r.rand(1..10)
    randomlySelectedStore = Store.find(store_id)
    if hash[randomlySelectedStore].nil?
      hash[randomlySelectedStore] = 1
    else
      hash[randomlySelectedStore] = hash[randomlySelectedStore] + 1
    end
        
    lineup = Lineup.new
    lineup.user = eachUser
    lineup.store = randomlySelectedStore
    lineup.cnt = hash[randomlySelectedStore]
    lineup.save!
  end
end


  
 
