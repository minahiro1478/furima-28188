FactoryBot.define do
  
  factory :item_image do
    image    {File.open("#{Rails.root}/public/images/test_image.png")}
    
    association :item
    
  end
end
