class Review < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  validates :body, presence: true
  validates_uniqueness_of :user_id, :scope => :item_id
end
