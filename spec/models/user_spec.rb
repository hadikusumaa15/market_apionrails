require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.build(:valid_user) }

  subject { @user }

  it { expect(subject).to respond_to(:password) }
  it { expect(subject).to respond_to(:password_confirmation) }
  it { expect(subject).to be_valid }

  it 'should respond to email' do
    expect(subject).to respond_to(:email) 
  end

  it 'should validate password confirmation' do
    invalid_user = FactoryGirl.build(:invalid_user)

    expect(invalid_user.save).to eq false 
  end

  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:email) }
  it { should allow_value('example@domain.com').for(:email) }

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
end
