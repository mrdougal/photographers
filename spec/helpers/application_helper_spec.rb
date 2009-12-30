require 'spec_helper'

describe ApplicationHelper do
  
  include ApplicationHelper


  describe "title" do
  
    it "should add the supplied text to the title" do
    
      title('cheese')
      @content_for_title.should == 'cheese - '
    end

    it "should append the supplied text to the meta_title" do
    
      title('cheese')
      title('bacon')
      @content_for_title.should == 'cheese - bacon - '
    end

    it "should return nil if supplied blank string" do
      title('')
      @content_for_title.should == nil
    end
  
    it "should return nil if supplied nil" do
      title(nil)
      @content_for_title.should == nil
    end
  
    it "should convert supplied objects to strings" do
                                 
      obj = Factory :photo, :name => "Hello there" 
      title(obj)
      @content_for_title.should == 'Hello there - '
    end
  end


  describe "meta description" do
  
    it "should add the supplied text to the description" do
    
      meta_description('cheese')
      @content_for_meta_description.should == 'cheese\n'
    end

    it "should replace description with the last supplied text" do
    
      meta_description('cheese')
      meta_description('bacon')
      @content_for_meta_description.should == 'cheese\nbacon\n'
    end

    it "should append anything if supplied blank string" do
      meta_description('')
      @content_for_meta_description.should be_blank
    end
  
    it "should convert supplied objects to strings" do
                                 
      obj = Factory :photo, :name => "Hello world" 
      meta_description(obj)
      @content_for_meta_description.should == 'Hello world\n'
    end
  end

end
