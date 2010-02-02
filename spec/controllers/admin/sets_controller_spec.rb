require 'spec_helper'

describe Admin::PhotoSetsController do

  # Since all we're really testing for here, is that we're rendering views
  integrate_views true

  before(:each) do
    activate_authlogic
  end  


  describe "not logged in" do
    it "should redirect to the login" do
      get :index
      response.should redirect_to(login_url)
    end
    
    it "should set the url in the session return to" do
      get :index
      session[:return_to].should == admin_photo_sets_path
    end
    
    it "should set something in the flash" do
      get :index
      response.flash.should_not be_empty
    end
  end
  
  describe "logged in " do
    
    before(:each) do
      @user = Factory :user
      UserSession.create @user
    end
    
    describe "index" do
    
      it "renders the photos template" do
        get :index
        response.should render_template('index')
      end
    end
 
    describe "set that exists" do
      
      before(:each) do
        @photo_set = Factory :photo_set
        @param = @photo_set.to_param
      end
    
      it "renders @show" do
        get :show, :id => @param
        response.should render_template('show')
      end
      
      it "renders @edit" do
        get :edit, :id => @param
        response.should render_template('edit') 
      end
      
      it "processes @update, and redirects to show" do
        put :update, :id => @param, :photo_set => { :description => 'Hello world'}
        response.should redirect_to admin_photo_set_path @photo_set
      end
      
    end
    
    describe "attempt to access non-existant set" do
      
      it "renders 404 as the set doesn't exists" do
        get :show, :id => "non-existant"
        response.should render_template('admin/shared/rescues/not_found') 
      end
    end
  
  end
  
end
