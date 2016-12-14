require 'rails_helper'

RSpec.describe Event, type: :model do
  
  let(:event) { build(:event) }
  
  # ----------------------------------------
  # Associations
  # ----------------------------------------

  it { should belong_to(:game) }
  it { should belong_to(:host) }
  it { should have_many(:attendings).dependent(:destroy) }
  it { should have_many(:attendees) }

  # ----------------------------------------
  # Validations
  # ----------------------------------------

  it { should validate_numericality_of(:min_players).is_greater_than(0) }

  it "should not allow a datetime to be set in the past" do 
    expect(build(:event, datetime: Time.now - 1)).not_to be_valid
  end

  # ----------------------------------------
  # Methods
  # ----------------------------------------

  describe "#full" do 

    it "returns true if the even is at full capacity" do 
      2.times do 
        event.attendees << build(:user)
      end
      expect(event).to be_full
    end

    it "returns false is there is room for another player" do 
      expect(event).not_to be_full
    end
  end
end
