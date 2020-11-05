FactoryBot.define do
  factory :order_address do
    postal_code     { '123-4567' }
    prefectures_id  { 2 }
    municipality    {'渋谷区'}
    address         {'渋谷1−1'}
    tell_phone      { '09012345678' }
  end
end
