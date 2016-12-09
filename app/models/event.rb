class Event < ApplicationRecord
  belongs_to :game
  belongs_to :host, class_name: 'User'
  has_many   :attendings, dependent: :destroy
  has_many   :attendees, through: :attendings, source: :user

  def full?
    players.count >= max_players
  end

  def players
    attendees + [host]
  end
end

