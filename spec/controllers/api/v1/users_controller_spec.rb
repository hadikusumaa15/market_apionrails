require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  before(:each) { request.headers['Accept'] = "application/vnd.marketplace.v1" }

  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create :valid_user
      get :show, params: { id: @user.id }, format: :json
      # cara baca di localhost gini:
      # http://api.lvh.me:3000/users/1
    end

    it "returns the information about a reporter on a hash" do
      byebug
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:email]).to eql @user.email
    end

    it { should respond_with 200 }
  end
end
