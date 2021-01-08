FactoryBot.define do
  factory :item do
    name {'editテスト'}
    introduction {'食べ物の紹介'}
    category_id {400}
    status_id {1}
    postage_id {2}
    prefecture_id {1}
    shipping_date_id {1} 
    price {23456}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

   end
end
