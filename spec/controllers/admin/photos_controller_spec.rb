require 'spec_helper'

describe Admin::PhotosController do

  
  # Since all we're really testing for here, is that we're rendering views
  integrate_views true
  
  
  
  before(:all) do
    
    @user = Factory.build(:user)
    @category = Factory :category, :name => "Wedddings"
    @set = Factory :photo_set, :name => "Dougal & Amanda", :category => @category 
    
    @photos = [ Factory(:photo, :category => @category, :photo_set => @set),
                Factory(:photo, :category => @category, :photo_set => @set) ]
  end
  
  describe "without logging in" do
    it "should redirect to the login" do
      get :edit, :id => '1'
      response.should redirect_to login_path
    end
  end


  describe "logged in " do
    
    before(:each) do
      activate_authlogic
      UserSession.create @user
    end
    
    describe "edit" do
      it "should be successful" do
        get :show, :id => @photos[1].id
        response.should be_success 
      end
    end
    
  end



end