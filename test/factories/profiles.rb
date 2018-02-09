FactoryBot.define do
  factory :profile do
    file { Faker::Lorem.sentence }
    picture { Faker::Placeholdit.image("50x50", 'jpg') }
  end
end
