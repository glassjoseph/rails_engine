require 'rails_helper'

RSpec.describe Customer, :type => :model do
  it 'has a valid factory' do
    expect(build(:customer)).to be_valid
  end

  let(:customer) { build(:customer) }

  describe "Attributes" do
    it { expect(customer).to respond_to(:first_name) }
    it { expect(customer).to respond_to(:last_name) }
    it { expect(customer).to respond_to(:created_at) }
    it { expect(customer).to respond_to(:updated_at) }
  end
end
