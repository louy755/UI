FactoryBot.define do
  factory :address do
    street_number { Faker::Address.street_address }
    city { Faker::Address.city_suffix }
    state { Faker::Address.state }
  end
end
