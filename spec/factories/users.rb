FactoryBot.define do
  factory :user do
    nickname              { 'ニック' }
    email                 {Faker::Internet.free_email}
    password              { 'Aa01234' }
    password_confirmation { 'Aa01234' }
    last_name             { '田中' }
    first_name            { '圭介' }
    last_kana        { 'タナカ' }
    first_kana       { 'ケイスケ' }
    birth_day { '1920-01-01' }
  end
end
