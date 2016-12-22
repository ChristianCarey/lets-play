class Event < ApplicationRecord
  belongs_to :game
  belongs_to :host, class_name: 'User'
  has_many   :reservations, dependent: :destroy
  #TODO rename attendees to guests
  has_many   :guests, through: :reservations, source: :user

  validates :min_players, numericality: { greater_than: 0 }
  validate :datetime_cannot_be_in_the_past
  #TODO maximum for max_players?

  default_scope { order('datetime ASC') }

  def full?
    players.count >= max_players
  end

  def players
    guests + [host]
  end

  private

  def datetime_cannot_be_in_the_past
    if datetime.present? && datetime < Time.now
      errors.add(:datetime, "can't be in the past")
    end
  end    
end

