require "open-uri"

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
comedian_data = [
  { name: "Kat", address: "Grünberger Straße 84, 10245 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206495/AF1QipP-ZY5uP2r1_OwGKEQ-NWpjuxjwdLpmaUGHkSPK_s1360-w1360-h1020_zq28jr.jpg" },
  { name: "Soojin", address: "Wühlischstraße 43, 10245 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206576/AF1QipOwohgqNwxExWgvImqjoHEghtQ07YpoRxTEWqM4_s1360-w1360-h1020_ifnobk.jpg" },
  { name: "Olivier", address: "Skalitzer Straße 80, 10997 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206607/AF1QipNBlNjJjWExtttwtFUg5ag99docUEp2JZeN_WlU_s680-w680-h510_lq3w40.jpg" },
  { name: "Lucas", address: "Richardstraße 10, 12043 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206662/AF1QipNquvy3tUS-uywAFPb0s8Sdjl6jpg8n3Cjk9BDk_s1360-w1360-h1020_lphhwy.jpg" },
  { name: "Sonia", address: "Reuterstraße 67, 12047 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206689/AF1QipOw0_1dV-NAfgZsgSr5ZPDHLc15ZozMVvZdUhR5_s1360-w1360-h1020_vphxpg.jpg" },
  { name: "Massih", address: "Brunnenstraße 197-198, 10119 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206746/AF1QipM5H6EgVD1j3uNAXBpTpPYiB-yoMuG1Gzt6MyZ-_s1360-w1360-h1020_nbo1qu.jpg" },
  { name: "Nakul", address: "Fasanenstraße 40, 10719 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206864/AF1QipMK_Nk2BTgTG8Z-ntMBjsDi_-MzHZfYcevjHGy-_s1360-w1360-h1020_txiisj.jpg" },
  { name: "Ahlam", address: "Lübbener Straße 1, 10997 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206991/AB5caB-MksqACPr8KHJIf0snoQea8vpPgJxzgcLWIsQtGzqJevnkRH5mkdH4-iuuZ-Z072SZwWhW-PTsY80TJjmIx_t3W2MKrTemRyGfELSTLm31dXtjxYgYHFQGAxhQneDwjkayKRs_s1360-w1360-h1020_ewnooy.jpg" },
  { name: "Otto", address: "Krossener Straße 15, 10245 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742207025/AF1QipPC1CL3_fhidgzd6l5yP2W8Ejhubm3Ebrdrg6Al_s1360-w1360-h1020_g9rfeb.jpg" },
  { name: "Oscar", address: "Adalbertstraße 96, 10999 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742207098/AF1QipMzuS5foPFsnhgSQ7Ef56CMVbcu4hfYPpwiyLLk_s1360-w1360-h1020_wnl4ot.jpg" },
  { name: "Tamari", address: "Zelterstraße 1, 10439 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742207121/AF1QipNR4M5V81JbP3axa8IqaL849A0x5_uj5DeBim7D_s1360-w1360-h1020_uulgjc.jpg" },
  { name: "Yuta", address: "Schlesische Straße 38, 10997 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742207235/AF1QipP6Z7_ti-E_N0mUDeVnJqmfOxO39TAFtTjl4xOt_s1360-w1360-h1020_yukbuc.jpg" },
  { name: "Daruisz", address: "Goltzstraße 7, 10781 Berlin", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742207274/AF1QipMduzroqt-zTUYYke86dmMAekgdPbdq17oRNmqn_s1360-w1360-h1020_wtaxtm.jpg" },
  { name: "Claire", address: "Reichenberger Str. 153, 10999 Berlin", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742210905/BoGo_Raum_S_Schweizer-10_oqa5b6.jpg" }
]
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
  { name: "The Wall Comedy", address: "Grünberger Straße 84, 10245 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206495/AF1QipP-ZY5uP2r1_OwGKEQ-NWpjuxjwdLpmaUGHkSPK_s1360-w1360-h1020_zq28jr.jpg" },
  { name: "Süss War Gestern", address: "Wühlischstraße 43, 10245 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206576/AF1QipOwohgqNwxExWgvImqjoHEghtQ07YpoRxTEWqM4_s1360-w1360-h1020_ifnobk.jpg" },
  { name: "Space Medusa", address: "Skalitzer Straße 80, 10997 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206607/AF1QipNBlNjJjWExtttwtFUg5ag99docUEp2JZeN_WlU_s680-w680-h510_lq3w40.jpg" },
  { name: "Sameheads", address: "Richardstraße 10, 12043 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206662/AF1QipNquvy3tUS-uywAFPb0s8Sdjl6jpg8n3Cjk9BDk_s1360-w1360-h1020_lphhwy.jpg" },
  { name: "Fitzcarraldo", address: "Reuterstraße 67, 12047 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206689/AF1QipOw0_1dV-NAfgZsgSr5ZPDHLc15ZozMVvZdUhR5_s1360-w1360-h1020_vphxpg.jpg" },
  { name: "Mein Haus am See", address: "Brunnenstraße 197-198, 10119 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206746/AF1QipM5H6EgVD1j3uNAXBpTpPYiB-yoMuG1Gzt6MyZ-_s1360-w1360-h1020_nbo1qu.jpg" },
  { name: "Rum Trader", address: "Fasanenstraße 40, 10719 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206864/AF1QipMK_Nk2BTgTG8Z-ntMBjsDi_-MzHZfYcevjHGy-_s1360-w1360-h1020_txiisj.jpg" },
  { name: "August Fengler", address: "Lübbener Straße 1, 10997 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206991/AB5caB-MksqACPr8KHJIf0snoQea8vpPgJxzgcLWIsQtGzqJevnkRH5mkdH4-iuuZ-Z072SZwWhW-PTsY80TJjmIx_t3W2MKrTemRyGfELSTLm31dXtjxYgYHFQGAxhQneDwjkayKRs_s1360-w1360-h1020_ewnooy.jpg" },
  { name: "Fitscher's Vogel", address: "Krossener Straße 15, 10245 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742207025/AF1QipPC1CL3_fhidgzd6l5yP2W8Ejhubm3Ebrdrg6Al_s1360-w1360-h1020_g9rfeb.jpg" },
  { name: "Villa Neukölln", address: "Hermannstraße 233, 12049 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742207053/AF1QipP7kkTKJbbEvou71rcTZPOlUweylvjbIP9kM6Xe_s1360-w1360-h1020_vuhcqn.jpg" },
  { name: "Cafe am Kotti", address: "Adalbertstraße 96, 10999 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742207098/AF1QipMzuS5foPFsnhgSQ7Ef56CMVbcu4hfYPpwiyLLk_s1360-w1360-h1020_wnl4ot.jpg" },
  { name: "Zaffke", address: "Zelterstraße 1, 10439 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742207121/AF1QipNR4M5V81JbP3axa8IqaL849A0x5_uj5DeBim7D_s1360-w1360-h1020_uulgjc.jpg" },
  { name: "Bar Henrietta", address: "Schlesische Straße 38, 10997 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742207235/AF1QipP6Z7_ti-E_N0mUDeVnJqmfOxO39TAFtTjl4xOt_s1360-w1360-h1020_yukbuc.jpg" },
  { name: "Salut! Classic Bar", address: "Goltzstraße 7, 10781 Berlin", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742207274/AF1QipMduzroqt-zTUYYke86dmMAekgdPbdq17oRNmqn_s1360-w1360-h1020_wtaxtm.jpg" },
  { name: "Bohnengold", address: "Reichenberger Str. 153, 10999 Berlin", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742210905/BoGo_Raum_S_Schweizer-10_oqa5b6.jpg" }
]
venue_data.each_with_index do |data, i|
  new_venue = User.find_or_create_by!(email: "venue#{i + 1}@example.com") do |user|
    user.user_type = :venue
    user.user_name = data[:name]
    user.address = data[:address]
    user.password = "password"
    user.description = "This is a description for venue #{i + 1}"
  end
  image = URI.open(data[:image_url])
  new_venue.photo.attach(io: image, filename: "#{data[:name]}.jpg", content_type: "image/jpg")
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
