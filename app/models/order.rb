# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :order_items

  validates :user, presence: true
  validates :address, presence: true

  validate :address_belongs_to_user

  def address_belongs_to_user
    errors.add(:address, 'Invalid address') if user.id != address.user.id
  end

  accepts_nested_attributes_for :order_items

  enum status: { created: 0, processing: 1 }

  def price
    c = Money::Collection.new(order_items.map(&:price))
    c.sum
  end
end
