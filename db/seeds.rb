  # first_name = Faker::Name.first_name
# last_name = Faker::Name.last_name
# person = Person.create(
#   :f_name => first_name
#   :l_name => last_name
#   :email => Faker::Internet.email(first_name + "." + last_name)
# )
# Person.where(id: 1..5).update(gender: 'Female')

include FactoryBot::Syntax::Methods
Person.destroy_all

genders = %w(Male Female)
100.times do |index|
  create(:person, gender: genders.sample)
end


Address.destroy_all

Person.all.each do |person|
  2.times do
    create(:address, person: person)
  end
end


Profile.destroy_all

Person.all.each do |person|
  create(:profile, person: person)
end
