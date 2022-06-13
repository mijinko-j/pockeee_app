class Post < ApplicationRecord
  belongs_to :item
  belongs_to :user
  belongs_to :member

  validates :day, presence: true
end
