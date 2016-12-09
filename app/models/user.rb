class User < ApplicationRecord
  has_many :ownerships, dependent: :destroy
  has_many :games, through: :ownerships
  has_many :attendings, dependent: :destroy
  has_many :attended_events, through: :attendings, source: :event
  has_many :hosted_events, class_name: 'Event', 
                           foreign_key: :host_id, 
                           dependent: :destroy

  def attend(event)
    attended_events << event
  end

  def attending?(event)
    event.attendees.include?(user)
  end
end
