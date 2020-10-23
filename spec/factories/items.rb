FactoryBot.define do
  factory :item do
    association :user
    name                         { '商品名を記入してください' }
    description                  { 'a' }
    price                        { 500 }
    condition_id                 { 2 }
    delivery_date_id             { 2 }
    shipping_id                  { 2 }
    shipment_source_id           { 2 }
    category_id                  { 2 }

    # trait :image do
    #   image { File.new("#{Rails.root}/spec/images/test_image.png") }
    # end
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
