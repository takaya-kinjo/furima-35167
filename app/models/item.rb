class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quantity
  belongs_to :delivery_payment
  belongs_to :delivery_prefecture
  belongs_to :delivery_time

  with_options presence: true do
    validates :titele
    validates :comment
    validates :preice
  end
  with_options numericality: {other_than: 1} do
    validates :category_id
    validates :quantity_id
    validates :delivery_payment_id
    validates :delivery_prefecture_id
    validates :delivery_time_id
  end
end
