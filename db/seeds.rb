THUMB_URLS = [
  "http://cf.geekdo-images.com/images/pic96574_t.jpg",
  "http://cf.geekdo-images.com/images/pic2419375_t.jpg",
  "http://cf.geekdo-images.com/images/pic1521633_t.jpg",
  "http://cf.geekdo-images.com/images/pic394356_t.jpg",
  "http://cf.geekdo-images.com/images/pic175966_t.jpg"
]

IMAGE_URLS = [
  "http://cf.geekdo-images.com/images/pic96574.jpg",
  "http://cf.geekdo-images.com/images/pic2419375.jpg",
  "http://cf.geekdo-images.com/images/pic1521633.jpg",
  "http://cf.geekdo-images.com/images/pic394356.jpg",
  "http://cf.geekdo-images.com/images/pic175966.jpg"
]

CATEGORIES = [
  "Adventure",
  "Fantasy",
  "Bluffing",
  "Party Game",
  "Puzzle",
  "Horror"
]

puts "Destroying users..."
User.destroy_all
puts "Destroying games..."
Game.destroy_all

puts "Creating Christian..."
User.create(first_name: 'Christian',
            last_name:  'Carey',
            email:      'christian@example.com',
            password:   'password',
            password_confirmation: 'password')
puts "Creating users..."
50.times do 
  first_name = Faker::Name.first_name
  User.create(first_name: first_name,
              last_name:  Faker::Name.last_name,
              email:      Faker::Internet.email(first_name),
              password:   'password',
              password_confirmation: 'password')
end

puts "Creating games..."
250.times do 
  Game.create(
    name:        Faker::Book.title,
    description: Faker::Lorem.paragraph(1),
    thumb_url:   THUMB_URLS.sample,
    image_url:   IMAGE_URLS.sample,
    category:    CATEGORIES.sample
  )
end

puts "Giving games to users..."
Game.all.each do |game|
  rand(1..20).times do
    user = User.all.sample
    unless user.owns?(game)
      user.games << game
    end
  end
end

puts "Creating events..."
User.all.each_with_index do |user, index|
  if index % 3 == 0
    rand(4..8).times do 
      user.hosted_events << Event.create(
        datetime:    Faker::Time.forward(30),
        min_players: rand(2..4),
        max_players: rand(4..8),
        game_id:     Game.all.sample.id
      )
    end
  end
end

puts "Making people go to events..."
Event.all.each do |event|
  rand(0..event.max_players).times do 
    user = User.all.sample
    unless event.attendees.include?(user) || event.host == user
      event.attendees << user
    end
  end
end




