FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { Faker::Gimei.last_name }
    first_name            { Faker::Gimei.first_name }
    last_name_kana        { Faker::Gimei.last_name.katakana }
    first_name_kana       { Faker::Gimei.first_name.katakana }
  end
end
