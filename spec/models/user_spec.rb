require 'spec_helper'

describe User do
  
  before(:each) do
    @user = Factory :user
  end

  describe "email" do
    it "should be required" do
      
      u = Factory.build :user, :email => nil
      u.valid?
      u.should have_at_least(1).error_on(:email)
      
    end
    
    it "should require email to be formatted like an email" do

      u = Factory.build :user, :email => 'cheese'
      u.valid?
      u.should have(1).error_on(:email)
    end
    
    it "should be unique" do
      
      u = User.new @user.attributes
      u.valid?
      
      u.errors[:email].should == 'has already been taken'
    end
    
    it "should be unique across the system" do
      
      u = User.new Factory.attributes_for(:user, :email => @user.email)
      u.valid?
      
      u.errors[:email].should == 'has already been taken'
    end
    
  end
  
  

end
