class Category < ActiveRecord::Base
  has_many :items
  validates :category_name, presence: :true
end
