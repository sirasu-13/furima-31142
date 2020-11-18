FactoryBot.define do
  factory :item do
    title { 'test' }
    price { '300' }
    description { 'test12345' }
    category_id { '2' }
    status_id { '2' }
    shipping_fee_id { '2' }
    area_id { '3' }
    guideline_id { '2'}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), 
      filename: 'test_image.png')
    end
  end
end
