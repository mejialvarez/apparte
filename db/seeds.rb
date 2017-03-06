[:artist, :client].each do |role|
  user = User.new
  user.full_name = Faker::Name.name
  user.email = Faker::Internet.email
  user.phone = Faker::Number.number(10)
  user.role = User.roles[role]

  p user.errors.messages unless user.save
end

50.times do
  artwork = Artwork.new
  artwork.name = Faker::Name.name
  artwork.description = Faker::Lorem.sentence
  artwork.price = Faker::Number.number(10)
  artwork.user = User.first

  p artwork.errors.messages unless artwork.save
end