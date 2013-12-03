require "spec_helper"
describe UsersController do 
  let(:valid_session) { {} } 
  let(:user) { create(:user) } 
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
  describe "GET edit" do
    it "assigns an user to an @user" do
      get :edit, { id: user.to_param }, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end
  describe "PUT update" do
    context "with valid attributes" do
     it "updates the requested user" do 
      a_user = create(:user, valid_attributes)
      put :update, {
        :id => a_user.to_param,
        :user => {:email => "abc@mymail.com"}
        }, valid_session
    end

    it "assigns the requested user as @user" do
      put :update, {
        :id => user.to_param,
        :user => { :email => "abc@mymail.com" }
        }, valid_session 
      expect(assigns(:user)).to eq(user)
    end

    it "redirects to the user page" do
        put :update, {
          id: user.to_param, 
          :user => valid_attributes
          }, valid_session
        expect(response).to redirect_to(user)
      end
    end
  end

end