class Event < ApplicationRecord
  belongs_to :game
  belongs_to :host, class_name: 'User'
  has_many   :attendees, through: :attendings, source: :user
end
