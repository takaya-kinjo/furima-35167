FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = "1" + Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name { "田中" }
    first_name_kana { "タナカ" }
    last_name { "次郎" }
    last_name_kana { "ジロウ" }
    birthday { 2020/01/20 }
  end
end