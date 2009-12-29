require 'spec_helper'

describe Photo do
  
  before(:all) do
    @photo = Factory :photo
  end
  
  after(:all) do
    @photo.destroy
  end
  

  describe "compatible images (jpg, png)" do
  
    it "should have a filename" do
      @photo.image_file_name.should_not be_blank
    end
    
    it "should have a filename" do
      @photo.image_file_name.should == 'png.png'
    end
  
    it "should have a content-type" do
      @photo.image_content_type.should == 'image/png'
    end
  

    describe "thumbnails" do
      
      it "should have thumbnails" do
        @photo.image.should have_thumbnails
      end
    
      it "should convert the thumbnails to png" do
        pending
      end
    
    end
  end
  
  describe "incompatible image formats (psd, pdf)" do
    
    it "should not have thumbnails" do
      
    end
    
  end
  
  


end
