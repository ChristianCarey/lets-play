class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :ownerships, dependent: :destroy
  # TODO don't allow duplicate games
  has_many :games, through: :ownerships
  has_many :reservations, dependent: :destroy
  has_many :reserved_events, through: :reservations, source: :event
  has_many :hosted_events, class_name: 'Event', 
                           foreign_key: :host_id, 
                           dependent: :destroy
  
  before_save :downcase_email

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 6 },
                       presence: true,
                       allow_nil: true
  validates :email, uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX },
                    presence: true

  def attend(event)
    reserved_events << event
  end

  def attending?(event)
    reserved_events.include?(event)
  end

  # TODO test this
  def owns?(game)
    games.include?(game)
  end

  def name
    "#{first_name}  #{last_name}"
  end

  private

  def downcase_email
    self.email = email.downcase if self.email
  end

end
