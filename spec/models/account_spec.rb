require 'spec_helper'

describe Account do

  describe "required attributes" do
    
    before(:each) do
      @account = Account.new Factory.attributes_for(:account)
    end
    
    [:name, :subdomain, :email, :phone].each do |val|
      it "should require #{val}" do
        @account[val] = nil
        @account.valid?
      
        @account.should have(1).error_on(val)
      end
    end
  end
  
  
  describe "default_url" do
    
    before(:each) do
      @account = Factory :account, :name => "newfangled", :subdomain => "newfangled"  
    end
    
    it "should have a default_url" do
      @account.default_url.should_not be_blank
    end

    it "should have append the subdomain to the base domain" do
      @account.default_url.should == 'newfangled.photo.local'
    end
    
  end

end
