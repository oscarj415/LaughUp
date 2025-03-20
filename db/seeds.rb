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
  { name: "Fitzcarraldo", address: "Reichenberger Str. 133, 10999 Berlin", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206689/AF1QipOw0_1dV-NAfgZsgSr5ZPDHLc15ZozMVvZdUhR5_s1360-w1360-h1020_vphxpg.jpg", description: "Fitzcarraldo is where 2000s hits meet quirky comedy. Pop in for a laugh, a drink, and some nostalgia with an unexpected DVD rental twist!" },
  { name: "Mein Haus am See", address: "Brunnenstraße 197-198, 10119 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206746/AF1QipM5H6EgVD1j3uNAXBpTpPYiB-yoMuG1Gzt6MyZ-_s1360-w1360-h1020_nbo1qu.jpg", description: "Prenzlauer Berg's poshest comedy venue, where cocktails and laughs come hand in hand. You’ll leave feeling classy, even if you’re only here for the jokes!" },
  { name: "Rum Trader", address: "Fasanenstraße 40, 10719 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206864/AF1QipMK_Nk2BTgTG8Z-ntMBjsDi_-MzHZfYcevjHGy-_s1360-w1360-h1020_txiisj.jpg", description: "A tiny speakeasy with an even tinier stage—Rum Trader is where intimate comedy meets old-school charm. Be sure to order a rum and savor the laughs!" },
  { name: "August Fengler", address: "Lübbener Straße 1, 10997 Berlin, Germany", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742206991/AB5caB-MksqACPr8KHJIf0snoQea8vpPgJxzgcLWIsQtGzqJevnkRH5mkdH4-iuuZ-Z072SZwWhW-PTsY80TJjmIx_t3W2MKrTemRyGfELSTLm31dXtjxYgYHFQGAxhQneDwjkayKRs_s1360-w1360-h1020_ewnooy.jpg", description: "A cool bar in Prenzlauer Berg, August Fengler doubles as a dance floor and kicker table haven. Come for the comedy, stay for the playful competition!" },
  { name: "Fitscher's Vogel", address: "Warschauer Str. 26, 10243 Berlin", image_url: "https://res.cloudinary.com/dri955bfe/image/upload/v1742207025/AF1QipPC1CL3_fhidgzd6l5yP2W8Ejhubm3Ebrdrg6Al_s1360-w1360-h1020_g9rfeb.jpg", description: "Dim lighting, funky vibes, and some seriously funny comedians—Fitscher's Vogel in Friedrichshain is the place to be for a low-key night of laughs." },
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
# comedian_ids = User.where(user_type: :comedian).pluck(:id)
# venue_ids = User.where(user_type: :venue).pluck(:id)

# 20.times do |i|
#   Event.create!(
#     comedian_id: comedian_ids.sample,
#     venue_id: venue_ids.sample,
#     title: "Event Title #{i + 1}",
#     description: "Event description #{i + 1}",
#     date_time: DateTime.now + i.days
#   )
# end

# THIS IS THE BEGIN OF THE EVENT CREATION FOR A COMEDIAN!!!
comedian = User.find_by(user_name: "Kat", user_type: :comedian)
if comedian
  # Randomly select a venue for the event
  # venue = User.where(user_type: :venue).sample

  # Create an event for the comedian "Kat" with a random venue
    Event.create!(
      comedian_id: comedian.id,
      venue_id: User.where(user_type: :venue).sample.id,
      title: "The Laugh Lab",
      description: "A stand-up comedy experiment where the funniest formulas are tested live!",
      date_time: DateTime.new(2025, 3, 21, 20, 0, 0)  # Event will be created randomly within the next 10 days
    )
  puts "Created an event for comedian #{comedian.user_name}."
else
  puts "Comedian Kat not found."
end
if comedian
# New Comedian
    Event.create!(
      comedian_id: comedian.id,
      venue_id: User.where(user_type: :venue).sample.id,
      title: "Mic Drop Madness",
      description: "A high-energy comedy showcase where every joke is a knockout!",
      date_time: DateTime.new(2025, 3, 21, 18, 0, 0)  # Event will be created randomly within the next 10 days
    )
  puts "Created an event for comedian #{comedian.user_name}."
else
  puts "Comedian Kat not found."
end
if comedian
  # New Comedian
      Event.create!(
        comedian_id: comedian.id,
        venue_id: User.where(user_type: :venue).sample.id,
        title: "Comedy Overload",
        description: "A back-to-back lineup of comedians bringing non-stop laughs!",
        date_time: DateTime.new(2025, 3, 20, 18, 0, 0)  # Event will be created randomly within the next 10 days
      )
    puts "Created an event for comedian #{comedian.user_name}."
  else
    puts "Comedian Kat not found."
  end

if comedian
    # New Comedian
        Event.create!(
          comedian_id: comedian.id,
          venue_id: User.where(user_type: :venue).sample.id,
          title: "LOL Factory",
          description: "A comedy production line churning out top-tier jokes all night!",
          date_time: DateTime.new(2025, 3, 22, 20, 0, 0)  # Event will be created randomly within the next 10 days
        )
      puts "Created an event for comedian #{comedian.user_name}."
    else
      puts "Comedian Kat not found."
  end

  if comedian
    # New Comedian
        Event.create!(
          comedian_id: comedian.id,
          venue_id: User.where(user_type: :venue).sample.id,
          title: "Stand-Up & Deliver",
          description: "A night where comedians take the stage and deliver their best material!",
          date_time: DateTime.new(2025, 3, 23, 21, 0, 0)  # Event will be created randomly within the next 10 days
        )
      puts "Created an event for comedian #{comedian.user_name}."
    else
      puts "Comedian Kat not found."
  end

# THIS IS THE BEGIN OF THE EVENT CREATION FOR A COMEDIAN!!!
comedian1 = User.find_by(user_name: "Soojin", user_type: :comedian)
if comedian1
  # Randomly select a venue for the event
  # venue = User.where(user_type: :venue).sample

  # Create an event for the comedian "Soojin" with a random venue
    Event.create!(
      comedian_id: comedian1.id,
      venue_id: User.where(user_type: :venue).sample.id,
      title: "The Ha-Ha Hour",
      description: "Sixty minutes of pure, unfiltered comedy gold!",
      date_time: DateTime.new(2025, 3, 21, 20, 0, 0)  # Event will be created randomly within the next 10 days
    )
  puts "Created an event for comedian #{comedian1.user_name}."
else
  puts "Comedian Kat not found."
end
if comedian1
# New Comedian
    Event.create!(
      comedian_id: comedian1.id,
      venue_id: User.where(user_type: :venue).sample.id,
      title: "Killin’ It!",
      description: "A comedy show where every performer is guaranteed to slay the crowd!",
      date_time: DateTime.new(2025, 3, 21, 18, 0, 0)  # Event will be created randomly within the next 10 days
    )
  puts "Created an event for comedian #{comedian1.user_name}."
else
  puts "Comedian Kat not found."
end
if comedian1
  # New Comedian
      Event.create!(
        comedian_id: comedian1.id,
        venue_id: User.where(user_type: :venue).sample.id,
        title: "The Punchline Pit",
        description: "A no-frills, all-thrills comedy show where jokes hit hard!",
        date_time: DateTime.new(2025, 3, 20, 18, 0, 0)  # Event will be created randomly within the next 10 days
      )
    puts "Created an event for comedian #{comedian1.user_name}."
  else
    puts "Comedian Kat not found."
  end

if comedian1
    # New Comedian
        Event.create!(
          comedian_id: comedian1.id,
          venue_id: User.where(user_type: :venue).sample.id,
          title: "Giggles & Gags",
          description: "A lighthearted comedy night full of witty wordplay and hilarious bits!",
          date_time: DateTime.new(2025, 3, 22, 20, 0, 0)  # Event will be created randomly within the next 10 days
        )
      puts "Created an event for comedian #{comedian1.user_name}."
    else
      puts "Comedian Kat not found."
  end

  if comedian1
    # New Comedian
        Event.create!(
          comedian_id: comedian1.id,
          venue_id: User.where(user_type: :venue).sample.id,
          title: "No Joke!",
          description: "A comedy show that’s seriously funny!",
          date_time: DateTime.new(2025, 3, 23, 21, 0, 0)  # Event will be created randomly within the next 10 days
        )
      puts "Created an event for comedian #{comedian1.user_name}."
    else
      puts "Comedian Kat not found."
  end

# THIS IS THE BEGIN OF THE EVENT CREATION FOR A COMEDIAN!!!
comedian2 = User.find_by(user_name: "Olivier", user_type: :comedian)
if comedian2
  # Randomly select a venue for the event
  # venue = User.where(user_type: :venue).sample

  # Create an event for the comedian "Olivier" with a random venue
    Event.create!(
      comedian_id: comedian2.id,
      venue_id: User.where(user_type: :venue).sample.id,
      title: "Funny Side Up",
      description: "A fresh and lively stand-up showcase that serves comedy sunny side up!",
      date_time: DateTime.new(2025, 3, 22, 20, 0, 0)  # Event will be created randomly within the next 10 days
    )
  puts "Created an event for comedian #{comedian2.user_name}."
else
  puts "Comedian Kat not found."
end
if comedian2
# New Comedian
    Event.create!(
      comedian_id: comedian2.id,
      venue_id: User.where(user_type: :venue).sample.id,
      title: "Laughter Unleashed",
      description: "A no-holds-barred comedy night where comedians go all out!",
      date_time: DateTime.new(2025, 3, 21, 18, 0, 0)  # Event will be created randomly within the next 10 days
    )
  puts "Created an event for comedian #{comedian2.user_name}."
else
  puts "Comedian Kat not found."
end
if comedian2
  # New Comedian
      Event.create!(
        comedian_id: comedian2.id,
        venue_id: User.where(user_type: :venue).sample.id,
        title: "The Roast Room",
        description: "A night of sharp wit and playful jabs, where no one is safe!",
        date_time: DateTime.new(2025, 3, 20, 18, 0, 0)  # Event will be created randomly within the next 10 days
      )
    puts "Created an event for comedian #{comedian2.user_name}."
  else
    puts "Comedian Kat not found."
  end

# THIS IS THE BEGIN OF THE EVENT CREATION FOR A COMEDIAN!!!
comedian3 = User.find_by(user_name: "Olivier", user_type: :comedian)
  if comedian3

    # Create an event for the comedian "Olivier" with a random venue
      Event.create!(
        comedian_id: comedian3.id,
        venue_id: User.where(user_type: :venue).sample.id,
        title: "Punchlines & Pints",
        description: "Enjoy top-tier comedy with a drink in hand at this laugh-out-loud show!",
        date_time: DateTime.new(2025, 3, 22, 20, 0, 0)  # Event will be created randomly within the next 10 days
      )
    puts "Created an event for comedian #{comedian3.user_name}."
  else
    puts "Comedian Kat not found."
  end
  if comedian3
  # New Comedian
      Event.create!(
        comedian_id: comedian3.id,
        venue_id: User.where(user_type: :venue).sample.id,
        title: "The Late Night Laughs Club",
        description: "A comedy showcase that keeps the jokes rolling well into the night!",
        date_time: DateTime.new(2025, 3, 21, 18, 0, 0)  # Event will be created randomly within the next 10 days
      )
    puts "Created an event for comedian #{comedian3.user_name}."
  else
    puts "Comedian Kat not found."
  end
  if comedian3
    # New Comedian
        Event.create!(
          comedian_id: comedian3.id,
          venue_id: User.where(user_type: :venue).sample.id,
          title: "Grin & Bear It",
          description: "A comedy night full of relatable humor about life's everyday struggles!",
          date_time: DateTime.new(2025, 3, 20, 18, 0, 0)  # Event will be created randomly within the next 10 days
        )
      puts "Created an event for comedian #{comedian3.user_name}."
    else
      puts "Comedian Kat not found."
    end

# THIS IS THE BEGIN OF THE EVENT CREATION FOR A COMEDIAN!!!
comedian4 = User.find_by(user_name: "Lucas", user_type: :comedian)
  if comedian4

    # Create an event for the comedian "Lucas" with a random venue
      Event.create!(
        comedian_id: comedian4.id,
        venue_id: User.where(user_type: :venue).sample.id,
        title: "The Giggle Gala",
        description: "A classy yet hilarious night of stand-up, perfect for comedy lovers!",
        date_time: DateTime.new(2025, 3, 22, 20, 0, 0)  # Event will be created randomly within the next 10 days
      )
    puts "Created an event for comedian #{comedian4.user_name}."
  else
    puts "Comedian Kat not found."
  end
  if comedian4
  # New Comedian
      Event.create!(
        comedian_id: comedian4.id,
        venue_id: User.where(user_type: :venue).sample.id,
        title: "Laugh Track Live",
        description: "A live stand-up experience that feels like the best comedy special you've ever seen!",
        date_time: DateTime.new(2025, 3, 21, 18, 0, 0)  # Event will be created randomly within the next 10 days
      )
    puts "Created an event for comedian #{comedian4.user_name}."
  else
    puts "Comedian Kat not found."
  end
  if comedian4
    # New Comedian
        Event.create!(
          comedian_id: comedian4.id,
          venue_id: User.where(user_type: :venue).sample.id,
          title: "Chuckles & Chills",
          description: "A unique comedy show blending stand-up with unexpected twists and surprises!",
          date_time: DateTime.new(2025, 3, 20, 18, 0, 0)  # Event will be created randomly within the next 10 days
        )
      puts "Created an event for comedian #{comedian4.user_name}."
    else
      puts "Comedian Kat not found."
    end

# THIS IS THE BEGIN OF THE EVENT CREATION FOR A COMEDIAN!!!
comedian5 = User.find_by(user_name: "Sonia", user_type: :comedian)
  if comedian5

    # Create an event for the comedian "Sonia" with a random venue
      Event.create!(
        comedian_id: comedian5.id,
        venue_id: User.where(user_type: :venue).sample.id,
        title: "Laughter Overload",
        description: "A comedy show so funny, it might cause uncontrollable giggles and snorts, bring your tissues for the tears of joy.",
        date_time: DateTime.new(2025, 3, 22, 20, 0, 0)  # Event will be created randomly within the next 10 days
      )
    puts "Created an event for comedian #{comedian5.user_name}."
  else
    puts "Comedian Kat not found."
  end
  if comedian5
  # New Comedian
      Event.create!(
        comedian_id: comedian5.id,
        venue_id: User.where(user_type: :venue).sample.id,
        title: "Jokes and Giggles",
        description: "Join us for a night of funny punchlines, ridiculous jokes, and a lot of laughs that'll leave your cheeks sore.",
        date_time: DateTime.new(2025, 3, 21, 18, 0, 0)  # Event will be created randomly within the next 10 days
      )
    puts "Created an event for comedian #{comedian5.user_name}."
  else
    puts "Comedian Kat not found."
  end
  if comedian5
    # New Comedian
        Event.create!(
          comedian_id: comedian5.id,
          venue_id: User.where(user_type: :venue).sample.id,
          title: "The Punchline Parade",
          description: "Walk through a parade of hilarious jokes and unforgettable punchlines, all wrapped up in one night of pure comedy gold.",
          date_time: DateTime.new(2025, 3, 20, 18, 0, 0)  # Event will be created randomly within the next 10 days
        )
      puts "Created an event for comedian #{comedian5.user_name}."
    else
      puts "Comedian Kat not found."
    end

# THIS IS THE BEGIN OF THE EVENT CREATION FOR A COMEDIAN!!!
comedian6 = User.find_by(user_name: "Oscar", user_type: :comedian)
  if comedian6

    # Create an event for the comedian "Oscar" with a random venue
      Event.create!(
        comedian_id: comedian6.id,
        venue_id: User.where(user_type: :venue).sample.id,
        title: "Comedy Under the Stars",
        description: "Laugh under the open sky with stand-up comedians delivering their best routines while the stars above shine bright.",
        date_time: DateTime.new(2025, 3, 22, 20, 0, 0)  # Event will be created randomly within the next 10 days
      )
    puts "Created an event for comedian #{comedian6.user_name}."
  else
    puts "Comedian Kat not found."
  end
  if comedian6
  # New Comedian
      Event.create!(
        comedian_id: comedian6.id,
        venue_id: User.where(user_type: :venue).sample.id,
        title: "Laugh Your Socks Off",
        description: "Get ready to lose your socks and your composure with a line-up of comedians that will make you laugh harder than ever.",
        date_time: DateTime.new(2025, 3, 21, 18, 0, 0)  # Event will be created randomly within the next 10 days
      )
    puts "Created an event for comedian #{comedian6.user_name}."
  else
    puts "Comedian Kat not found."
  end
  if comedian6
    # New Comedian
        Event.create!(
          comedian_id: comedian6.id,
          venue_id: User.where(user_type: :venue).sample.id,
          title: "The Jester's Jamboree",
          description: "A whimsical night filled with goofy jokes, silly stories, and a jester’s variety of humor, this comedy show will leave you in stitches.",
          date_time: DateTime.new(2025, 3, 20, 18, 0, 0)  # Event will be created randomly within the next 10 days
        )
      puts "Created an event for comedian #{comedian6.user_name}."
    else
      puts "Comedian Kat not found."
    end




comedian7 = User.find_by(user_name: "Massih", user_type: :comedian)
    if comedian7

      # Create an event for the comedian "Massih" with a random venue
        Event.create!(
          comedian_id: comedian7.id,
          venue_id: User.where(user_type: :venue).sample.id,
          title: "Loco Laughs",
          description: "Experience the wildest and most spontaneous comedy performances, where anything goes and everything’s fair game for a laugh.",
          date_time: DateTime.new(2025, 3, 22, 20, 0, 0)  # Event will be created randomly within the next 10 days
        )
      puts "Created an event for comedian #{comedian7.user_name}."
    else
      puts "Comedian Kat not found."
end

comedian8 = User.find_by(user_name: "Nakul", user_type: :comedian)
    if comedian8

      # Create an event for the comedian "Nakul" with a random venue
        Event.create!(
          comedian_id: comedian8.id,
          venue_id: User.where(user_type: :venue).sample.id,
          title: "Comedic Chaos",
          description: "Brace yourself for a night of unpredictable comedy where the jokes come fast, the punchlines hit hard, and chaos reigns supreme.",
          date_time: DateTime.new(2025, 3, 22, 20, 0, 0)  # Event will be created randomly within the next 10 days
        )
      puts "Created an event for comedian #{comedian8.user_name}."
    else
      puts "Comedian Kat not found."
end

comedian9 = User.find_by(user_name: "Ahlam", user_type: :comedian)
    if comedian9

      # Create an event for the comedian "Ahlam" with a random venue
        Event.create!(
          comedian_id: comedian9.id,
          venue_id: User.where(user_type: :venue).sample.id,
          title: "Laughing All the Way",
          description: "Come join us for a rollercoaster ride of jokes that will have you laughing all the way through the night, from start to finish.",
          date_time: DateTime.new(2025, 3, 22, 20, 0, 0)  # Event will be created randomly within the next 10 days
        )
      puts "Created an event for comedian #{comedian9.user_name}."
    else
      puts "Comedian Kat not found."
end

comedian10 = User.find_by(user_name: "Otto", user_type: :comedian)
    if comedian10

      # Create an event for the comedian "Otto" with a random venue
        Event.create!(
          comedian_id: comedian10.id,
          venue_id: User.where(user_type: :venue).sample.id,
          title: "The Comedy Circus",
          description: "Step right up for a comedy circus like no other! A variety of stand-up acts will have you in stitches under the big top.",
          date_time: DateTime.new(2025, 3, 22, 20, 0, 0)  # Event will be created randomly within the next 10 days
        )
      puts "Created an event for comedian #{comedian10.user_name}."
    else
      puts "Comedian Kat not found."
end

comedian11 = User.find_by(user_name: "Tamari", user_type: :comedian)
    if comedian11

      # Create an event for the comedian "Tamari" with a random venue
        Event.create!(
          comedian_id: comedian11.id,
          venue_id: User.where(user_type: :venue).sample.id,
          title: "Outrageous Laughter",
          description: "Get ready for comedy so outrageous, it might make you gasp in disbelief before bursting into uncontrollable laughter.",
          date_time: DateTime.new(2025, 3, 22, 20, 0, 0)  # Event will be created randomly within the next 10 days
        )
      puts "Created an event for comedian #{comedian11.user_name}."
    else
      puts "Comedian Kat not found."
end

comedian12 = User.find_by(user_name: "Yuta", user_type: :comedian)
    if comedian12

      # Create an event for the comedian "Yuta" with a random venue
        Event.create!(
          comedian_id: comedian12.id,
          venue_id: User.where(user_type: :venue).sample.id,
          title: "The Gag Factory",
          description: "Enter the factory where jokes are made, and laugh until your sides hurt from all the crafted gags and hilarious moments.",
          date_time: DateTime.new(2025, 3, 22, 20, 0, 0)  # Event will be created randomly within the next 10 days
        )
      puts "Created an event for comedian #{comedian12.user_name}."
    else
      puts "Comedian Kat not found."
end

comedian13 = User.find_by(user_name: "Daruisz", user_type: :comedian)
    if comedian13

      # Create an event for the comedian "Daruisz" with a random venue
        Event.create!(
          comedian_id: comedian13.id,
          venue_id: User.where(user_type: :venue).sample.id,
          title: "LOL Land",
          description: "Step into LOL Land, where every corner is filled with absurd jokes, witty remarks, and comical surprises.",
          date_time: DateTime.new(2025, 3, 22, 20, 0, 0)  # Event will be created randomly within the next 10 days
        )
      puts "Created an event for comedian #{comedian13.user_name}."
    else
      puts "Comedian Kat not found."
end

comedian14 = User.find_by(user_name: "Claire", user_type: :comedian)
    if comedian14

      # Create an event for the comedian "Claire" with a random venue
        Event.create!(
          comedian_id: comedian14.id,
          venue_id: User.where(user_type: :venue).sample.id,
          title: "Stand-Up Shenanigans",
          description: "Expect nothing but pure, unfiltered shenanigans from comedians who aren’t afraid to push the boundaries of humor.",
          date_time: DateTime.new(2025, 3, 22, 20, 0, 0)  # Event will be created randomly within the next 10 days
        )
      puts "Created an event for comedian #{comedian14.user_name}."
    else
      puts "Comedian Kat not found."
end


# -------------------
# Comedian Reviews
# -------------------

puts "Seeding reviews..."

reviews_content = [
  { content: "Absolutely hilarious! I haven't laughed this hard in years. The comedian had perfect timing and a great connection with the audience.", rating: 5 },
  { content: "Decent performance, but I expected more originality. Some jokes felt a bit outdated.", rating: 3 },
  { content: "The show was okay, but the comedian seemed unprepared. A few awkward pauses and some jokes fell flat.", rating: 2 },
  { content: "Incredible night! The entire crowd was in tears from laughter. Definitely coming back for more.", rating: 5 },
  { content: "Not my cup of tea. I prefer more intelligent humor, and this felt a bit too crude for my taste.", rating: 2 },
  { content: "Brilliant set! The comedian's ability to improvise and interact with the audience was top-tier.", rating: 5 },
  { content: "It was an average show. Some parts were funny, but overall, it didn't leave a lasting impression.", rating: 3 },
  { content: "Completely unprofessional! The comedian was late, and the jokes felt rushed. Very disappointing.", rating: 1 },
  { content: "Loved it! The storytelling was engaging, and I related to so many of the jokes.", rating: 5 },
  { content: "One of the worst comedy shows I’ve attended. Jokes were repetitive and lacked creativity.", rating: 1 },
  { content: "An absolute riot! The crowd was engaged the entire time, and the energy was fantastic.", rating: 5 },
  { content: "Cringeworthy at times. The comedian relied too much on shock humor rather than clever writing.", rating: 2 },
  { content: "A must-see! If you enjoy sharp wit and observational humor, this is for you.", rating: 5 },
  { content: "The jokes were good, but the delivery felt off. Maybe just an off night for the comedian.", rating: 3 },
  { content: "So much fun! I left with my stomach hurting from laughing so much.", rating: 5 },
  { content: "Offensive and not in a funny way. There's a fine line between edgy and just plain bad taste.", rating: 1 },
  { content: "The best comedy show I've ever been to! Absolutely worth every penny.", rating: 5 },
  { content: "Boring. The jokes felt recycled, and the comedian didn’t engage much with the audience.", rating: 2 },
  { content: "What a talent! This comedian is going to be huge someday, no doubt about it.", rating: 5 },
  { content: "Mediocre at best. A few chuckles here and there, but nothing memorable.", rating: 3 }
]

90.times do
  reviewer = User.fan.sample
  event = Event.all.sample
  reviewed_user = User.comedian.sample
  review = reviews_content.sample

  Review.create!(
    user_id: reviewer.id,
    event_id: event.id,
    rating: review[:rating], # Matching rating from the review content
    content: review[:content], # Review text
    reviewed_id: reviewed_user.id,
    user_type: rand(0..1), # Adjust based on your user type logic
    created_at: Time.now,
    updated_at: Time.now
  )
end

puts "✅ Successfully seeded 20 comedian reviews!"

# -------------------
# Venue Reviews
# -------------------

puts "Seeding reviews..."

reviews_content = [
  { content: "Absolutely hilarious! I haven't laughed this hard in years. The comedian had perfect timing and a great connection with the audience.", rating: 5 },
  { content: "Decent performance, but I expected more originality. Some jokes felt a bit outdated.", rating: 3 },
  { content: "The show was okay, but the comedian seemed unprepared. A few awkward pauses and some jokes fell flat.", rating: 2 },
  { content: "Incredible night! The entire crowd was in tears from laughter. Definitely coming back for more.", rating: 5 },
  { content: "Not my cup of tea. I prefer more intelligent humor, and this felt a bit too crude for my taste.", rating: 2 },
  { content: "Brilliant set! The comedian's ability to improvise and interact with the audience was top-tier.", rating: 5 },
  { content: "It was an average show. Some parts were funny, but overall, it didn't leave a lasting impression.", rating: 3 },
  { content: "Completely unprofessional! The comedian was late, and the jokes felt rushed. Very disappointing.", rating: 1 },
  { content: "Loved it! The storytelling was engaging, and I related to so many of the jokes.", rating: 5 },
  { content: "One of the worst comedy shows I’ve attended. Jokes were repetitive and lacked creativity.", rating: 1 },
  { content: "An absolute riot! The crowd was engaged the entire time, and the energy was fantastic.", rating: 5 },
  { content: "Cringeworthy at times. The comedian relied too much on shock humor rather than clever writing.", rating: 2 },
  { content: "A must-see! If you enjoy sharp wit and observational humor, this is for you.", rating: 5 },
  { content: "The jokes were good, but the delivery felt off. Maybe just an off night for the comedian.", rating: 3 },
  { content: "So much fun! I left with my stomach hurting from laughing so much.", rating: 5 },
  { content: "Offensive and not in a funny way. There's a fine line between edgy and just plain bad taste.", rating: 1 },
  { content: "The best comedy show I've ever been to! Absolutely worth every penny.", rating: 5 },
  { content: "Boring. The jokes felt recycled, and the comedian didn’t engage much with the audience.", rating: 2 },
  { content: "What a talent! This comedian is going to be huge someday, no doubt about it.", rating: 5 },
  { content: "Mediocre at best. A few chuckles here and there, but nothing memorable.", rating: 3 }
]

90.times do
  reviewer = User.fan.sample
  event = Event.all.sample
  reviewed_user = User.venue.sample
  review = reviews_content.sample

  Review.create!(
    user_id: reviewer.id,
    event_id: event.id,
    rating: review[:rating], # Matching rating from the review content
    content: review[:content], # Review text
    reviewed_id: reviewed_user.id,
    user_type: rand(0..1), # Adjust based on your user type logic
    created_at: Time.now,
    updated_at: Time.now
  )
end

puts "✅ Successfully seeded 20 venue reviews!"

puts "Seeding interests..."

# Fetch all events and users
events = Event.all
users = User.all

# Ensure users exist
if users.empty? || events.empty?
  puts "No users or events found! Please seed users and events first."
  exit
end

# Assign random users to be interested in each event
events.each do |event|
  interested_users = users.sample(rand(10..30)) # Randomly assign 10-30 users per event
  interested_users.each do |user|
    Interest.create!(event_id: event.id, user_id: user.id)
  end
end

puts "✅ Interests seeded successfully!"

puts "Seeding completed!"
