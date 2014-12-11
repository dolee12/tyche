class User < ActiveRecord::Base
  validates :phone, presence: true
  has_many :lineups
end
