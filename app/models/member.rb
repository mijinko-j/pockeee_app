class Member < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :comments
  has_one_attached :image

  validates :name,  presence: true
  validates :fixed, presence: true
  validates :color, presence: true
end
