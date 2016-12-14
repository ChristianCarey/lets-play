require 'rails_helper'

RSpec.describe Game, type: :model do
  
  let(:game) { build(:game) }
  
  # ----------------------------------------
  # Associations
  # ----------------------------------------
  
  it { should have_many(:ownerships).dependent(:destroy) }
  it { should have_many(:owners) }
  it { should have_many(:events) } 

  # ----------------------------------------
  # Validations
  # ----------------------------------------

  it "is valid with default attributes" do 
    expect(game).to be_valid
  end

  it { should validate_presence_of(:name) }
end
