require 'spec_helper'

describe PhotoSet do

  before(:each) do
    @set = Factory :photo_set
  end

  describe "requirement of name" do
    
    it "should require a name" do
      photo_set = Factory.build(:photo_set, :name => nil )
      photo_set.should have(1).error_on(:name)
      photo_set.errors[:name].should =~ /can't be left blank/
    end
    
    it "should require the name to be unique when it belongs to the same category" do
      photo_set = Factory.build(:photo_set, :name => @set.name, :category => @set.category )
      photo_set.should have(1).error_on(:name)
      photo_set.errors[:name].should =~ /has already been taken/
    end
    
  end

end
