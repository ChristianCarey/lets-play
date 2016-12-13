class Ownership < ApplicationRecord
  belongs_to :user
  belongs_to :game
  # TODO make ownerships unique
end
