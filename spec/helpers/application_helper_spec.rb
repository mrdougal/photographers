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

    it "should append anything if supplied blank string" do
      title('')
      @content_for_title.should == ''
    end
  
    it "should convert supplied objects to strings" do
                                 
      obj = Factory :photo
      title(obj)
      @content_for_title.should =~ /#{obj.to_s}/
    end
  end


end
