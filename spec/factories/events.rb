FactoryGirl.define do
  factory :event do
    datetime Time.now + 1.day
    min_players 1
    max_players 3
    game 
    host
  end
end
