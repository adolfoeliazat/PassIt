class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :item_requests, dependent: :destroy
end
