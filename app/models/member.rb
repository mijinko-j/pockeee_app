class Member < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  belongs_to :item
  has_one_attached :image

  validates :name,  presence: true
  validates :fixed, presence: true,
  numericality: { only_integer: true, less_than_or_equal_to: 9_999_999, allow_blank: true }, format: { with: /\A[0-9]+\z/, allow_blank: true }
  validates :color, presence: true
  validates :image, presence: true
end
