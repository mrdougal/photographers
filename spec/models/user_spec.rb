require 'spec_helper'

describe User do
  
  before(:each) do
    @user = Factory :user
  end

  describe "email" do
    it "should be required" do
      # lambda { Factory :user, :email => nil }.should raise_error(error)
      
      u = Factory.build :user, :email => nil
      u.valid?
      u.should have_at_least(1).error_on(:email)
      
    end
    
    it "should require email to be formatted like an email" do

      u = Factory.build :user, :email => 'cheese'
      u.valid?
      u.should have(1).error_on(:email)
    end
  end


end
