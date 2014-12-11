class Store < ActiveRecord::Base
  validates :reg_no, length: {is: 12}
  validates :name, :tel, presence: true
  has_many :lineups
end