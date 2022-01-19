FactoryBot.define do
  factory :purchase_address do
    token         { 'tok_abcdefghijk00000000000000000'}
    post_code     { '123-4567' }
    area_id       { Faker::Number.between(from: 2, to: 48) }
    city          { '港区' }
    street        { '1-1' }
    building_name { '東京ハイツ' }
    phone_number  { '09012345678' }
  end
end
