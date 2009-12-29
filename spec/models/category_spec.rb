require 'spec_helper'

describe Category do
  
  before(:each) do
    @category = Factory :category
  end

  it "should require a name" do
    lambda { Factory :category, :name => nil }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
  describe "permalink" do
    
    it "should have a peramlink" do
      @category.permalink.should_not be_blank    
    end
    
    it "should update the permalink to match the name" do
      @category.name = 'Something different'
      @category.save
      @category.permalink.should == 'something-different'
    end
    
  end
  
  it "doesn't require a description" do
    lambda { Factory :category, :description => nil }.should_not raise_error
  end
  
  it "should belong to a site" do
    pending
  end
  
  it "should have many photos" do
    pending
  end
  
  it "should have many sets" do
    pending
  end

end
