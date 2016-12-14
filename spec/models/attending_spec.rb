require 'rails_helper'

RSpec.describe Attending, type: :model do

  let(:attending) { build(:attending) }
  let(:second_attending) do 
    build(:attending, user: attending.user, 
                      event: attending.event)
  end
  
  # ----------------------------------------
  # Associations
  # ----------------------------------------

  it { should belong_to(:user) }
  it { should belong_to(:event) }

  # ----------------------------------------
  # Validations
  # ----------------------------------------  

  it "is valid with default values" do 
    expect(attending).to be_valid
  end

  it "validates uniqueness of user with event" do 
    attending.save
    expect(second_attending).not_to be_valid
  end
end
