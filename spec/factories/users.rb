FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    encrypted_password {password}
    first_name { Gimei.kanji }
    first_name_kana { Gimei.katakana}
    last_name { Gimei.kanji }
    last_name_kana { Gimei.katakana}
    birthday { 2020-01-20 }
  end
end