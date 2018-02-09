FactoryBot.define do
  factory :person do
    f_name {  Faker::Name.first_name }
    l_name {  Faker::Name.last_name }
    username { Faker::Internet.user_name }
    phone_number { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.free_email }
    date_of_birth { Faker::Date.birthday(18, 65) }
  end
end
