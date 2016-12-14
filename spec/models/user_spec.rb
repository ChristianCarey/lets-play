require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { build(:user) }

  # ----------------------------------------
  # Associations
  # ----------------------------------------

  it { should have_many(:ownerships).dependent(:destroy) }
  it { should have_many(:games) }
  it { should have_many(:attendings).dependent(:destroy) }
  it { should have_many(:attended_events) }
  it { should have_many(:hosted_events).dependent(:destroy) }

  # ----------------------------------------
  # Associations
  # ----------------------------------------

  it "is valid with default attributes" do 
    expect(user).to be_valid
  end

  it { should validate_presence_of(:first_name) }
  
  it { should validate_presence_of(:last_name) }
  
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }

  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }

  # ----------------------------------------
  # Methods
  # ----------------------------------------

  describe "#attend" do 

    let(:event) { build_stubbed(:event) }
    
    it "adds an event to attended_events" do 
      user.attend(event)
      expect{ user.attend(event) }.to change{ user.attended_events.length }.by(1)
    end
  end
end
