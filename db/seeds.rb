# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts "Seeding data..."

# Fans
5.times do |i|
  User.find_or_create_by!(email: "fan#{i + 1}@example.com") do |user|
    user.user_type = :fan
    user.user_name = "Fan User #{i + 1}"
    user.password = "password"
  end
end
puts "Created 5 fan users."

# Comedians
5.times do |i|
  User.find_or_create_by!(email: "comedian#{i + 1}@example.com") do |user|
    user.user_type = :comedian
    user.user_name = "Comedian User #{i + 1}"
    user.description = "I'm a funny comedian #{i + 1}"
    user.insta_handle = "@comedian#{i + 1}"
    user.password = "password"
  end
end
puts "Created 5 comedian users."

# Venues
5.times do |i|
  User.find_or_create_by!(email: "venue#{i + 1}@example.com") do |user|
    user.user_type = :venue
    user.user_name = "Venue User #{i + 1}"
    user.address = "Venue Street #{i + 1}"
    user.latitude = rand(52.0..53.0)
    user.longitude = rand(13.0..14.0)
    user.password = "password"
    user.description = "This is a description for venue #{i + 1}" # ★ここが重要
  end
end
puts "Created 5 venue users."

# Events
comedian_ids = User.where(user_type: :comedian).pluck(:id)
venue_ids = User.where(user_type: :venue).pluck(:id)

5.times do |i|
  Event.create!(
    comedian_id: comedian_ids.sample,
    venue_id: venue_ids.sample,
    title: "Event Title #{i + 1}",
    description: "Event description #{i + 1}",
    date_time: DateTime.now + i.days
  )
end
puts "Created 5 events."

puts "Seeding completed!"
