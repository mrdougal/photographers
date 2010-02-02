require 'spec_helper'

describe PhotoSet do

  before(:each) do
    @set = Factory :photo_set
  end

  it "should require a name" do
    @set = Factory.build :photo_set, :name => nil
    @set.save.should_not be_true
    @set.should have(1).error_on(:name) 
  end
  
  it "should generate a permalink from the name" do
    @set.permalink.should_not be_blank
  end
  
  it "should respond to photos" do
    @set.should respond_to('photos')
  end
  
  describe "with photos" do
    
    before(:each) do
      @photo = Factory :photo
      @set.photos << @photo
    end
    
    it "should have 1 photo" do
      @set.photos.count.should == 1
    end
    
    it "photo.set should point back to our newly created @set" do
      @photo.photo_set.should == @set
    end
    
    
  end


end
