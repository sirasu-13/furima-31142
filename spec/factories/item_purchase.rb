FactoryBot.define do
  factory :item_purchase do
    token          {'tok_abcdefghijk00000000000000000'}
    post_number    {'123-4567'}
    area_id  {3}
    municipality      {'横浜市'}
    house_number     {'1-1-1'}
    building_name  {'建物ビル'}
    phone_number   {'09022223333'} 
  end
end