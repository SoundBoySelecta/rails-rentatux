require 'faker'

def get_path(image)
  File.new(Rails.root.join("app/assets/images/tux_pictures/#{image}"))
end


Booking.destroy_all
Tuxedo.destroy_all
User.destroy_all

puts "STARTING SEEDING PROCEDURES"
puts 'Creating 100 fake users...'
10.times do
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
end



puts '100 users created!'
puts 'starting creation of Tuxedos'
30.times do
  urls = ["tux001.jpg", "tux002.jpg", "tux003.jpg", "tux004.jpeg", "tux005.jpeg",
    "tux006.jpeg", "tux007.jpg", "tux008.jpg", "tux009.jpeg", "tux010.jpeg",
    "tux011.jpeg", "tux012.jpg", "tux013.jpg", "tux014.jpg"]

  tuxedo = Tuxedo.new(
    color: Faker::Color.color_name,
    style: Faker::Hipster.words(1)[0],
    condition: ["Mint", "Almost new", "Slightly used", "Used", "Heavily used"].sample,
    year: (1975..2018).to_a.sample,
    size: ["Big", "Medium", "Small"].sample,
    picture: get_path(urls.sample),
    user: User.all.to_a.sample,
  )
  tuxedo.save!
end
puts 'tuxedos created!'
puts 'starting creation of Bookings'
40.times do
  booking = Booking.new(
    status: ["Pending", "Approved", "Denied"].sample,
    start_date: Faker::Date.between(500.days.ago, Date.today),
    end_date: Faker::Date.between(500.days.ago, Date.today),
    user: User.all.to_a.sample,
    tuxedo: Tuxedo.all.to_a.sample
  )
booking.save!
end
puts 'bookings created!'
puts "SEED FINISHED"

puts 'Finished!'


