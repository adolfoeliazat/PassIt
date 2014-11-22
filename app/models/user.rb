class User < ActiveRecord::Base

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :items, dependent: :destroy
  has_many :item_requests, dependent: :destroy

  mount_uploader :avatar, AvatarUploader
end
