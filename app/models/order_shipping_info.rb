class OrderShippingInfo
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :delivery_prefecture_id, :city, :address, :phone_number, :building

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :delivery_prefecture_id, numericality: {other_than: 1} 
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{11}\z/}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping_info.create(postal_code: postal_code, delivery_prefecture_id: delivery_prefecture_id, city: city, address: address, phone_number: phone_number, building: building)
  end
end