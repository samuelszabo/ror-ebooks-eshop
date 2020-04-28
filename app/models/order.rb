class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :order_items

  validates :user, presence: true
  validates :address, presence: true

  accepts_nested_attributes_for :order_items

  enum status: {created: 0, processing: 1}
end
