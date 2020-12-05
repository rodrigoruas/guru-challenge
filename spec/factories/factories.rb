FactoryBot.define do

  factory :playlist, class: Playlist do
    name { Faker::Music::PearlJam.album }
    description { Faker::Quotes::Shakespeare }
  end

  factory :user, class: User do
    email { Faker::Internet.email}
    first_name { Faker::Name.first_name }
  end
end