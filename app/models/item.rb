class Item < ApplicationRecord
  belongs_to :user
  has_many :posts

  validates :name, presence: true
  validates :price, presence: true,
  numericality: { only_integer: true, less_than_or_equal_to: 9_999_999, allow_blank: true }, format: { with: /\A[0-9]+\z/, allow_blank: true }
end
