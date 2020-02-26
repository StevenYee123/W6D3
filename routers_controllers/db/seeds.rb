# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all

u1 = User.create(username: "Artist1", email: "artist1@appacademy.io")
u2 = User.create(username: "Artist2", email: "artist2@appacademy.io")
u3 = User.create(username: "Artist3", email: "artist3@appacademy.io")
u4 = User.create(username: "Artist4", email: "artist4@appacademy.io")
u5 = User.create(username: "Artist5", email: "artist5@appacademy.io")
u6 = User.create(username: "Artist6", email: "artist6@appacademy.io")
u7 = User.create(username: "Artist7", email: "artist7@appacademy.io")
u8 = User.create(username: "Artist8", email: "artist8@appacademy.io")

Artwork.delete_all 
a1 = Artwork.create(artist_id: u1.id, title: "Hello", image_url: "hello.png")
a2 = Artwork.create(artist_id: u2.id, title: "Goodybe", image_url: "goodbye.png")
a3 = Artwork.create(artist_id: u3.id, title: "Farewell", image_url: "farewell.png")
a4 = Artwork.create(artist_id: u4.id, title: "Adios", image_url: "adios.png")

ArtworkShare.delete_all 
ArtworkShare.create(artwork_id: a1.id, viewer_id: u1.id)
ArtworkShare.create(artwork_id: a2.id, viewer_id: u2.id)
ArtworkShare.create(artwork_id: a3.id, viewer_id: u3.id)
ArtworkShare.create(artwork_id: a4.id, viewer_id: u4.id)