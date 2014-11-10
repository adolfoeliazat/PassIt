class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :item_requests, dependent: :destroy

  validates :name, :description, :image, :price, presence: true

  mount_uploader :image, ImageUploader
end
