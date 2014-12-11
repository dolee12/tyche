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

(1..10).each do |i|
  s = Store.new
  s.reg_no = "111-22-33445"
  s.name = "놀부 부대찌게" + i.to_s
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
  (1..2).each do |i|
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


  
 
