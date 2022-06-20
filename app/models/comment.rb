class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :member

  validates :comment, presence: true
end
