# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Artist.destroy_all
Gallery.destroy_all
Painting.destroy_all

artist1 = Artist.create(name: "kobe", age: 88, experience: 100)
artist2 = Artist.create(name: "james", age: 77, experience: 99)
artist3 = Artist.create(name: "wade", age: 66, experience: 98)

gal1 = Gallery.create(name: "gallery 1", location: "Adelaide")
gal2 = Gallery.create(name: "gallery 2", location: "New York")
gal3 = Gallery.create(name: "gallery 3", location: "La")

3.times do
    Painting.create(
      name: Faker::Name.name, 
      price: Faker::Number.between(from: 10000, to: 100000), 
      artist_id: Artist.ids.sample, 
      gallery_id: Gallery.ids.sample
    )
  end
  