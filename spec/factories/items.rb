FactoryBot.define do
  factory :item do
    association :user

    product_name    { 'ジャケット' }
    explanation     { '2010年頃に1万円で購入したジャケットです。ライトグレーで傷はありません。あわせやすいのでおすすめです。' }
    category_id     { 1 }
    state_id        { 1 }
    delivery_fee_id { 1 }
    prefecture_id   { 1 }
    required_day_id { 1 }
    price           { 300 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
