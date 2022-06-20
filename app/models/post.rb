class Post < ApplicationRecord
  belongs_to :item
  belongs_to :user
  belongs_to :member
  has_many :comments

  validates :day, presence: true
end
