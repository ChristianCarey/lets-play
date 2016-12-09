class User < ApplicationRecord
  has_many :ownerships, dependent: :destroy
  has_many :games, through: :ownerships
  has_many :attendings, dependent: :destroy
  has_many :attended_events, through: :attendings
  has_many :hosted_events, class_name: 'Event', foreign_key: :host_id
end
