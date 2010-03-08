require 'spec_helper'

describe Category do

  before(:each) do
    @category = Factory :category
  end

  describe "requirement of name" do
    
    it "should require a name" do
      category = Factory.build(:category, :name => nil )
      category.should have(1).error_on(:name)
      category.errors[:name].should =~ /can't be left blank/
    end
    
    it "should require the name to be unique" do
      category = Factory.build(:category, :name => @category.name)
      category.should have(1).error_on(:name)
      category.errors[:name].should =~ /has already been taken/
    end
    
  end



end