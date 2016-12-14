class Game < ApplicationRecord
  has_many :ownerships, dependent: :destroy
  has_many :owners, through: :ownerships, source: :user
  has_many :events
  validates_presence_of :name
end
