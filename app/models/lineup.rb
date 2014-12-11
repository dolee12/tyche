class Lineup < ActiveRecord::Base
  validates :person_cnt, presence: true
  
  belongs_to :user
  belongs_to :store
end
