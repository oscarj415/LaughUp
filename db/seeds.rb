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
  { name: "Kat", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742293091/WhatsApp_Image_2025-03-18_at_10.56.29_7_ehtjlp.jpg", description: "A British comedian who’ll have you laughing at things you never thought were funny. Her love for orange is the only thing brighter than her punchlines!" },
  { name: "Soojin", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742293099/WhatsApp_Image_2025-03-18_at_10.56.29_5_be9qhi.jpg", description: "When Soojin isn’t making jokes about football, she’s making jokes about everything else. Tottenham might not win trophies, but she’ll definitely win you over with her wit!" },
  { name: "Olivier", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742293100/WhatsApp_Image_2025-03-18_at_10.56.29_rzetkq.jpg", description: "French and funny, Olivier’s comedy is as sharp as his sound effects. Whether he’s telling jokes or composing music, he’s always in tune with laughter!" },
  { name: "Lucas", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742293105/WhatsApp_Image_2025-03-18_at_10.56.30_jtrkni.jpg", description: "Lucas is the guy with a dog, a great sense of humor, and the best ‘dad jokes’ you’ll hear. His French-German mix makes him as multi-layered as his punchlines!" },
  { name: "Sonia", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742293091/WhatsApp_Image_2025-03-18_at_10.56.29_6_ntt6ph.jpg", description: "Sonia’s comedy is like her acting career—dramatic, hilarious, and full of surprises. She’s a master at turning everyday moments into epic laugh-out-loud stories!" },
  { name: "Massih", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742293095/WhatsApp_Image_2025-03-18_at_10.56.29_4_mv2ikd.jpg", description: "When Massih isn’t practicing yoga, he’s bending the rules of comedy. His Persian-German combo is as intriguing as his obscure hobbies and hilarious takes on them!" },
  { name: "Nakul", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742293105/WhatsApp_Image_2025-03-18_at_10.56.30_1_xmmut2.jpg", description: "Nakul is the sweetest family man you’ll ever meet—until he cracks a joke. His humor will make you laugh harder than his daily phone calls to his wife!" },
  { name: "Ahlam", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742293094/WhatsApp_Image_2025-03-18_at_10.56.29_2_qj18pz.jpg", description: "Ahlam’s fashion is as posh as her punchlines—sharp, stylish, and unexpected. She’s got a way of making the most fashionable moments hilariously relatable!" },
  { name: "Otto", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742293093/WhatsApp_Image_2025-03-18_at_10.56.29_3_kw3hrz.jpg", description: "Otto’s German precision doesn’t just apply to tech—it’s in his comedy too. His AI-powered humor is so on point, even his punchlines come with an algorithm!" },
  { name: "Oscar", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742305707/screenshot_20250226-165046_gallery_l2xja8.jpg", description: "Oscar’s obsession with soccer might just be matched by his love for a good joke. Whether playing or watching, he’ll make you laugh harder than a last-minute goal!" },
  { name: "Tamari", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742293110/WhatsApp_Image_2025-03-18_at_10.56.55_fkljex.jpg", description: "Tamari’s comedy is as sweet as her late-night baked goods. She’s the only comedian who can make you laugh while making you hungry for a midnight snack!" },
  { name: "Yuta", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742293107/WhatsApp_Image_2025-03-18_at_10.56.47_ofnrvo.jpg", description: "Yuta’s comedy will have you dancing with laughter. Between his passion for dance and his dog Lexi, you’re guaranteed a performance you’ll never forget!" },
  { name: "Daruisz", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742293105/WhatsApp_Image_2025-03-18_at_10.57.07_zr8xqr.jpg", description: "In Spandau, Daruisz is the ruler of both the village and the comedy scene. His unique brand of humor will make you feel like royalty—minus the crown!" },
  { name: "Claire", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742293100/WhatsApp_Image_2025-03-18_at_10.56.29_1_wvffaz.jpg", description: "Claire’s comedy is so intuitive, she can tell when Oscar needs a ticket before he asks. Her telepathic humor will leave you wondering if she’s reading your mind!" }
]

comedian_data.each_with_index do |data, i|
  new_comedian = User.find_or_create_by!(email: "comedian#{i + 1}@example.com") do |user|
    user.user_type = :comedian
    user.user_name = data[:name]
    user.description = data[:description]
    user.insta_handle = "@comedian#{i + 1}"
    user.password = "password"
  end
  image = URI.open(data[:image_url])
  new_comedian.photo.attach(io: image, filename: "#{data[:name]}.jpg", content_type: "image/jpg")
end
puts "Created #{comedian_data.size} comedian users."

# -------------------
# Venues
# -------------------
venue_data = [
  { name: "The Wall Comedy", address: "Grünberger Straße 84, 10245 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206495/AF1QipP-ZY5uP2r1_OwGKEQ-NWpjuxjwdLpmaUGHkSPK_s1360-w1360-h1020_zq28jr.jpg", description: "The Wall Comedy is where Berlin’s funniest comedians hit the stage. Expect to laugh so hard you’ll forget you’re standing in one of the coolest spots in Friedrichshain!" },
  { name: "Süss War Gestern", address: "Wühlischstraße 43, 10245 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206576/AF1QipOwohgqNwxExWgvImqjoHEghtQ07YpoRxTEWqM4_s1360-w1360-h1020_ifnobk.jpg", description: "A chill bar by day, Süss War Gestern turns into a lively dance club post-comedy show. Come for the laughs, stay for the late-night moves on the dance floor!" },
  { name: "Space Medusa", address: "Skalitzer Straße 80, 10997 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206607/AF1QipNBlNjJjWExtttwtFUg5ag99docUEp2JZeN_WlU_s680-w680-h510_lq3w40.jpg", description: "A quirky Kreuzberg bar that blends the best of comedy with a touch of space-age vibes. It’s out of this world—just like the talent they bring to the stage!" },
  { name: "Sameheads", address: "Richardstraße 10, 12043 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206662/AF1QipNquvy3tUS-uywAFPb0s8Sdjl6jpg8n3Cjk9BDk_s1360-w1360-h1020_lphhwy.jpg", description: "Neukölln's coolest spot for comedy and eclectic performances. If you’re not laughing, you’re probably dancing—Sameheads has got the vibe for both!" },
  { name: "Fitzcarraldo", address: "Reuterstraße 67, 12047 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206689/AF1QipOw0_1dV-NAfgZsgSr5ZPDHLc15ZozMVvZdUhR5_s1360-w1360-h1020_vphxpg.jpg", description: "Fitzcarraldo is where 2000s hits meet quirky comedy. Pop in for a laugh, a drink, and some nostalgia with an unexpected DVD rental twist!" },
  { name: "Mein Haus am See", address: "Brunnenstraße 197-198, 10119 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206746/AF1QipM5H6EgVD1j3uNAXBpTpPYiB-yoMuG1Gzt6MyZ-_s1360-w1360-h1020_nbo1qu.jpg", description: "Prenzlauer Berg's poshest comedy venue, where cocktails and laughs come hand in hand. You’ll leave feeling classy, even if you’re only here for the jokes!" },
  { name: "Rum Trader", address: "Fasanenstraße 40, 10719 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206864/AF1QipMK_Nk2BTgTG8Z-ntMBjsDi_-MzHZfYcevjHGy-_s1360-w1360-h1020_txiisj.jpg", description: "A tiny speakeasy with an even tinier stage—Rum Trader is where intimate comedy meets old-school charm. Be sure to order a rum and savor the laughs!" },
  { name: "August Fengler", address: "Lübbener Straße 1, 10997 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206991/AB5caB-MksqACPr8KHJIf0snoQea8vpPgJxzgcLWIsQtGzqJevnkRH5mkdH4-iuuZ-Z072SZwWhW-PTsY80TJjmIx_t3W2MKrTemRyGfELSTLm31dXtjxYgYHFQGAxhQneDwjkayKRs_s1360-w1360-h1020_ewnooy.jpg", description: "A cool bar in Prenzlauer Berg, August Fengler doubles as a dance floor and kicker table haven. Come for the comedy, stay for the playful competition!" },
  { name: "Fitscher's Vogel", address: "Krossener Straße 15, 10245 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742207025/AF1QipPC1CL3_fhidgzd6l5yP2W8Ejhubm3Ebrdrg6Al_s1360-w1360-h1020_g9rfeb.jpg", description: "Dim lighting, funky vibes, and some seriously funny comedians—Fitscher's Vogel in Friedrichshain is the place to be for a low-key night of laughs." },
  { name: "Villa Neukölln", address: "Hermannstraße 233, 12049 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742207053/AF1QipP7kkTKJbbEvou71rcTZPOlUweylvjbIP9kM6Xe_s1360-w1360-h1020_vuhcqn.jpg", description: "Villa Neukölln is where elegance meets edgy comedy. Sip on cocktails, catch a performance, and revel in Neukölln’s charming atmosphere!" },
  { name: "Cafe am Kotti", address: "Adalbertstraße 96, 10999 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742207098/AF1QipMzuS5foPFsnhgSQ7Ef56CMVbcu4hfYPpwiyLLk_s1360-w1360-h1020_wnl4ot.jpg", description: "Cafe am Kotti is Berlin's ultimate budget-friendly comedy hangout. Get ready for chaos, laughs, and great vibes, all surrounded by the iconic Kottbuser Tor energy!" },
  { name: "Zaffke", address: "Zelterstraße 1, 10439 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742207121/AF1QipNR4M5V81JbP3axa8IqaL849A0x5_uj5DeBim7D_s1360-w1360-h1020_uulgjc.jpg", description: "Zaffke in Pankow brings together eclectic charm and belly-laugh-inducing comedy. It’s the kind of place where every night feels like an unpredictable adventure!" },
  { name: "Bar Henrietta", address: "Malplaquetstraße 28, 13347 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742207235/AF1QipP6Z7_ti-E_N0mUDeVnJqmfOxO39TAFtTjl4xOt_s1360-w1360-h1020_yukbuc.jpg", description: "A stylish bar with top-tier cocktails, a curated wine list, and enough laughs to make your night unforgettable. Comedy at Bar Henrietta is as smooth as their drinks!" },
  { name: "Salut! Classic Bar", address: "Goltzstraße 7, 10781 Berlin", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742207274/AF1QipMduzroqt-zTUYYke86dmMAekgdPbdq17oRNmqn_s1360-w1360-h1020_wtaxtm.jpg", description: "Salut! Classic Bar is where the cocktails are timeless and the comedy is unforgettable. For those who appreciate a great drink and even greater laughs in an intimate setting!" },
  { name: "Bohnengold", address: "Reichenberger Str. 153, 10999 Berlin", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742210905/BoGo_Raum_S_Schweizer-10_oqa5b6.jpg", description: "Bohnengold is a bar where pinball, kicker, and spontaneous dance breaks meet stand-up comedy. It’s the perfect place to enjoy a lively night filled with games, drinks, and laughs!" }
]

venue_data.each_with_index do |data, i|
  new_venue = User.find_or_create_by!(email: "venue#{i + 1}@example.com") do |user|
    user.user_type = :venue
    user.user_name = data[:name]
    user.address = data[:address]
    user.password = "password"
    user.description = data[:description]
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
