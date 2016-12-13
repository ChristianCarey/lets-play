FactoryGirl.define do
  factory :event do
    datetime "2016-12-08 22:28:27"
    min_players 1
    max_players 1
    game 
    host
  end
end
