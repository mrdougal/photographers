require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdminController do

  describe "not logged in" do

    describe "requesting bad url" do
      
      %w(cheese bacon ham).each do |i|
        it "get 'admin/#{i}' should redirect to login" do
          get :not_found, :url => i
          response.should render('admin/shared/rescues/not_found')
        end
      end
      
    end
  end

  describe "logged in" do

    before(:each) do
      activate_authlogic
      UserSession.create Factory.build(:user)
    end

    describe "requesting bad page" do

      %w(cheese bacon ham).each do |i|

        it "get #{i} should return status 404" do
          get :missing, :url => [i] 
          response.should be_missing
        end
      end

    end
  end




end
