FactoryBot.define do
  factory :purchase_form do
    postal_code              {"354-8976"}
    prefecture_id       {"1"}
    city              {"setagaya"}
    house_number          {"meruheisu"}
    phone_number            {"0000000000"}
    token {"a1234sd"}
    building_name {"マンション"}
  end
end
