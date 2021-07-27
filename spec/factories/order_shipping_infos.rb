FactoryBot.define do
  factory :order_shipping_info do
    postal_code            { '123-4567' }
    delivery_prefecture_id { 3 }
    city                   { '沖縄県' }
    address                { '1-1' }
    building               { '首里城' }
    phone_number           { '01023456789' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
