require "spec_helper"
describe UsersController do 
  let(:valid_session) { {} } 
  let(:user) { create(:user) } 
  let(:invalid_user) { create(:user, street: nil) } 
  let(:valid_attributes) { attributes_for(:user) } 

  describe "GET index" do
    it "assigns all users as @users" do
      get :index, { }, valid_session
      expect(assigns(:users)).to eq([user])
    end
  describe "GET show"  
    it "assigns the requested user as @user" do
      get :show, { id: user.to_param }, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end
end