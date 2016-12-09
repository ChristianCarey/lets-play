class Game < ApplicationRecord
  has_many :ownerships
  has_many :owners, through: :ownerships, source: :user
  has_many :events
end
