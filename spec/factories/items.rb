FactoryBot.define do
  factory :item do
    name             { Faker::Name.initials(number: 2) }
    description      { Faker::Lorem.sentence }
    category_id      { Faker::Number.between(from: 2, to: 11) }
    status_id        { Faker::Number.between(from: 2, to: 7) }
    shipping_cost_id { Faker::Number.between(from: 2, to: 3) }
    shipping_day_id  { Faker::Number.between(from: 2, to: 4) }
    prefecture_id    { Faker::Number.between(from: 2, to: 48) }
    price            { Faker::Number.between(from: 1, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
