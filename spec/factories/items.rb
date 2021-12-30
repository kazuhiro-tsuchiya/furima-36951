FactoryBot.define do
  factory :item do
    item_name        { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    item_explain     { Faker::Lorem.characters(number: 100, min_alpha: 1, min_numeric: 1) }
    category_id      { Faker::Number.between(from: 2, to: 11) }
    quality_id       { Faker::Number.between(from: 2, to: 6) }
    burden_id        { Faker::Number.between(from: 2, to: 3) }
    area_id          { Faker::Number.between(from: 2, to: 48) }
    delivery_day_id  { Faker::Number.between(from: 2, to: 4) }
    price            { Faker::Number.between(from: 1, to: 9_999_999) }
    #association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/maxresdefault.jpeg'), filename: 'maxresdefault.jpeg')
    end
  end
end
