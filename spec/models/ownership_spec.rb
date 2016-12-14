require 'rails_helper'

RSpec.describe Ownership, type: :model do
  
  let(:ownership) { build(:ownership) }
  let(:second_ownership) do 
    build(:ownership, user: ownership.user, 
                      game: ownership.game)
  end
  
  # ----------------------------------------
  # Associations
  # ----------------------------------------

  it { should belong_to(:user) }
  it { should belong_to(:game) }

  # ----------------------------------------
  # Validations
  # ----------------------------------------  

  it "is valid with default values" do 
    expect(ownership).to be_valid
  end

  it "validates uniqueness of user with game" do 
    ownership.save
    expect(second_ownership).not_to be_valid
  end
end
