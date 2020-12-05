require "faker"

Video.destroy_all
Section.destroy_all
Playlist.destroy_all
User.destroy_all

20.times do
  playlist = Playlist.create(name: Faker::Music::PearlJam.song , description: Faker::Music::PearlJam.album, min_subscription: rand(0..2))
  rand(3..5).times do
    section = Section.create(name: Faker::Movie.title , description: Faker::Movie.quote, playlist: playlist)
    rand(5..15).times do  
      video = Video.create(name: Faker::Movie.title , description: Faker::Movie.quote, section: section)
    end
  end
end

User.create(email: "rodrigo@test.com", first_name: "Rodrigo")