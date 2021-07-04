class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quantity
  belongs_to :delivery_payment
  belongs_to :delivery_prefecture
  belongs_to :delivery_time
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :comment
    validates :price, format: {with: /\A[-]?[0-9]+(\.[0-9]+)?\z/}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :image
  end
  with_options numericality: {other_than: 1} do
    validates :category_id
    validates :quantity_id
    validates :delivery_payment_id
    validates :delivery_prefecture_id
    validates :delivery_time_id
  end
end
