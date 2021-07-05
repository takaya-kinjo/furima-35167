FactoryBot.define do
  factory :item do
    title { "タイトル" }
    comment { "すごい" }
    category_id { 2 } 
    quantity_id { 2 }
    delivery_payment_id { 2 }
    delivery_prefecture_id { 2 }
    delivery_time_id { 2 }
    price { 700 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/tamago.png'), filename: 'tamago.png')
    end

  end
end
