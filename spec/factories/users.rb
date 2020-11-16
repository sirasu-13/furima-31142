FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    email { Faker::Internet.free_email }
    password { 'test1234' }
    password_confirmation { 'test1234' }
    last_name { '漢字' }
    first_name { 'ひらがな' }
    last_name_kana { 'カタ' }
    first_name_kana { 'カナ' }
    birth_date { Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today) }
  end
end
