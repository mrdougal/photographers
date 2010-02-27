require 'spec_helper'

describe Admin::PhotosController do

  
  # Since all we're really testing for here, is that we're rendering views
  integrate_views true
  
  
  
  before(:all) do
    @photos = [
      Factory(:photo, :tag_list => "tasty"),
      Factory(:photo, :tag_list => "tasty")
       ]
  end
  
  describe "without logging in" do
    it "should redirect to the login" do
      get :index
      response.should redirect_to login_path
    end
  end


  describe "logged in " do
    
    before(:each) do
      activate_authlogic
      UserSession.create Factory.build(:user)
    end
    
    describe "index" do
    
      it "should be ok" do
        get :index
        response.should be_success
      end
    end
    
    describe "show" do
      
      it "should be successful" do
        get :show, :id => @photos[1].id
        response.should be_success
      end
    end
    
    describe "edit" do
      it "should be successful" do
        get :show, :id => @photos[1].id
        response.should be_success 
      end
    end
    
  end



end