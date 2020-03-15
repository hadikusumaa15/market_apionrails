require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  it 'should respond to email' do
    expect(subject).to respond_to(:email) 
  end

  it { expect(subject).to respond_to(:password) }
  it { expect(subject).to respond_to(:password_confirmation) }

  it { expect(subject).to be_valid }
end
