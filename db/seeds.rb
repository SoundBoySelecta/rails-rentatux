require 'faker'

puts 'Creating 100 fake users...'
100.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "test123",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    rating:  (0..5).to_a.sample,
    city: Faker::Address.city,
    country: Faker::Address.country
  )
  user.save!
  (0..5).to_a.sample.times do
    tuxedo = Tuxedo.new(
      color: Faker::Color.color_name,
      style: Faker::Hipster.words,
      condition: ["mint", "almost new", "slightly used", "used", "heavily used"].sample,
      year: (1975..2018).to_a.sample,
      size: ["big", "medium", "small"].sample,
      picture: ["1234.jpg", "5678.png", "23836.png"].sample,
      user_id: (1..100).to_a.sample,
    )
  tuxedo.save!
  end
  (0..5).to_a.sample.times do
    booking = Booking.new(
      status: ["available", "approved", "pending approval", "denied"].sample,
      start_date: Faker::Date.between(500.days.ago, Date.today),
      end_date: Faker::Date.between(500.days.ago, Date.today),
      user_id: (1..100).to_a.sample,
      tuxedo_id: (1..200).to_a.sample
    )
  user.save!
  end



end



puts 'Finished!'
