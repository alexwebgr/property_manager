class Property < ApplicationRecord
  belongs_to :user
  belongs_to :transaction_type

  validates :title, presence: true, length: { maximum: 155 }
  validates :area, presence: true
  validates :placeId, presence: true
  validates :price, presence: true, numericality: true
end
