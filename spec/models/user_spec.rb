require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  it 'should respond to email' do
    expect(subject).to respond_to(:email) 
  end

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_confirmation_of(:password) }
  it { should allow_value('example@domain.com').for(:email) }

  it { expect(subject).to respond_to(:password) }
  it { expect(subject).to respond_to(:password_confirmation) }
  it { expect(subject).to be_valid }

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
end
