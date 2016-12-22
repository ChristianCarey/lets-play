require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:reservation) { build(:reservation) }
  let(:second_reservation) do 
    build(:reservation, user: reservation.user, 
                      event: reservation.event)
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
    expect(reservation).to be_valid
  end

  it "validates uniqueness of user with event" do 
    reservation.save
    expect(second_reservation).not_to be_valid
  end
end
