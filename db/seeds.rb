puts "Seeding data..."

Event.destroy_all
User.destroy_all
# -------------------
# Fans
# -------------------
5.times do |i|
  User.find_or_create_by!(email: "fan#{i + 1}@example.com") do |user|
    user.user_type = :fan
    user.user_name = "Fan User #{i + 1}"
    user.password = "password"
  end
end
puts "Created 5 fan users."

# -------------------
# Comedians
# -------------------
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

# -------------------
# Venues
# -------------------
venue_data = [
  { name: "Tiergarten", address: "Straße des 17. Juni, Berlin, Germany" },
  { name: "Tempelhofer Feld", address: "Tempelhofer Damm, Berlin, Germany" },
  { name: "Volkspark Friedrichshain", address: "Friedrichshain, Berlin, Germany" },
  { name: "Mauerpark", address: "Bernauer Str., Berlin, Germany" },
  { name: "Treptower Park", address: "Alt-Treptow, Berlin, Germany" },
  { name: "Grunewald", address: "Grunewald, Berlin, Germany" },
  { name: "Görlitzer Park", address: "Görlitzer Str., Berlin, Germany" },
  { name: "Volkspark Humboldthain", address: "Brunnenstraße, Berlin, Germany" },
  { name: "Schlosspark Charlottenburg", address: "Spandauer Damm, Berlin, Germany" },
  { name: "Viktoriapark", address: "Kreuzberg, Berlin, Germany" },
  { name: "Britzer Garten", address: "Buckower Damm, Berlin, Germany" },
  { name: "Schillerpark", address: "Wedding, Berlin, Germany" },
  { name: "Rudolph-Wilde-Park", address: "Schöneberg, Berlin, Germany" },
  { name: "Plänterwald", address: "Plänterwald, Berlin, Germany" },
  { name: "Natur-Park Südgelände", address: "Priesterweg, Berlin, Germany" }
]

venue_data.each_with_index do |data, i|
  User.find_or_create_by!(email: "venue#{i + 1}@example.com") do |user|
    user.user_type = :venue
    user.user_name = data[:name]
    user.address = data[:address]
    user.password = "password"
    user.description = "This is a description for venue #{i + 1}"
  end
end
puts "Created #{venue_data.size} venue users."

# -------------------
# Events
# -------------------
comedian_ids = User.where(user_type: :comedian).pluck(:id)
venue_ids = User.where(user_type: :venue).pluck(:id)

20.times do |i|
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
