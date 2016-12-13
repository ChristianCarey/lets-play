class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :ownerships, dependent: :destroy
  # TODO don't allow duplicate games
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
    attended_events.include?(event)
  end

  def name
    "#{first_name}  #{last_name}"
  end
end
