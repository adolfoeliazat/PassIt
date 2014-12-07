class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :item_requests, dependent: :delete_all
  has_many :reviews, dependent: :delete_all

  validates :name, :description, :price, presence: true

  mount_uploader :image, ImageUploader

=begin
  scope :address, self.joins(User.select(:address))
  scope :latitude, self.joins(User.select(:latitude))
  scope :longitude, self.joins(User.select(:longitude))
=end
end
