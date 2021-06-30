class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :titele
    validates :comment
    validates :category_id
    validates :quantity_id
    validates :delivery_payment_id
    validates :delivery_prefecture_id
    validates :delivery_time_id
    validates :preice
  end
end
