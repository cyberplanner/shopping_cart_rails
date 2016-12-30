class Item < ActiveRecord::Base
  validates :user_id, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  belongs_to :user
end
