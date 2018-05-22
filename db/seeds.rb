require 'faker'

puts 'Creating 100 fake users...'
100.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "test123",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name ,
    rating:  (0..5).to_a.sample,
    city: Faker::Address.city,
    country: Faker::Address.country
  )
  user.save!
end
puts 'Finished!'
