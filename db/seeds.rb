4.times do
  user = User.new
  user.full_name = Faker::Name.name
  user.email = Faker::Internet.email
  user.phone = Faker::Number.number(10)
  user.role = User.roles[:artist]

  p user.errors.messages unless user.save
end

50.times do
  artwork = Artwork.new
  artwork.name = Faker::Name.name
  artwork.description = Faker::Lorem.sentence
  artwork.price = Faker::Number.number(10)
  artwork.user = User.all.sample

  p artwork.errors.messages unless artwork.save
end