require 'spec_helper'

describe Admin::AccountsController do

  def mock_account(stubs={})
    @mock_account ||= mock_model(Account, stubs)
  end
  
  
  before(:each) do
    
    activate_authlogic
    @current_account = Factory :account, :name => "cheese", :subdomain => "cheese"  
    request.stub(:subdomains).and_return([@current_account.subdomain])
    
  end
  
  describe "urls" do
    
    it "should have a sub-domain" do
      request.subdomains.should == ['cheese']
    end
  end

  describe "not logged in" do
    
    it "should redirect show to the login" do
      get :show
      response.should redirect_to(login_path)
    end

    it "should redirect edit to the login" do
      get :edit
      response.should redirect_to(login_path)
    end
    
  end

  describe "logged in" do
    
    before(:each) do
      # Log ourselves in
      @user = Factory :user, :account => @current_account
      UserSession.create @user
    end
    
    
    describe "GET show" do
      it "should render show" do
        get :show
        response.should render_template('show')
      end
    end

    describe "GET edit" do
      it "should render edit" do
        get :edit
        response.should render_template('edit')
      end
    end

    describe "PUT update" do

      describe "with valid params" do
        it "redirects to show the account" do
          put :update, :account => {:phone => '1234567890'}
          response.should redirect_to(admin_account_path)
          
          # It should set the flash
          response.flash[:notice].should =~ /updated/
        end
      end

      describe "with invalid params" do
        it "re-renders the 'edit' template" do
          put :update, :account => { :cheese => 'cheddar' }
          response.should render_template('edit')
        end
      end
    end
 end
end
