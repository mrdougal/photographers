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
      @photo.file_file_name.should_not be_blank
    end
    
    it "should have a filename" do
      @photo.file_file_name.should == 'png.png'
    end
  
    it "should have a content-type" do
      @photo.file_content_type.should == 'image/png'
    end
  

    describe "thumbnails" do
      
      it "should have thumbnails" do
        pending
      end
    
      it "should convert the thumbnails to png" do
        pending
      end
    
    end
  end
  
  describe "incompatible image formats (psd, pdf)" do
   
    before(:each) do
      @photo = Photo.new Factory.attributes_for(:photo, :file => File.new(File.join(fixture_path, 'photos','text.txt')))
    end
    
    it "should reject the file" do
      
      @photo.save
      @photo.should have(1).error_on(:file)
    end
    
    
  end
  
  describe "tags" do
    
    context "empty" do
      
      it "should have any categories" do
        @photo.tags.should be_empty
      end
    end
    
    context "with tags" do
      
      before(:each) do
        @photo.update_attribute :tag_list, 'Cheese, Ham'
      end
      
      it "should have tags" do
        @photo.tags.should_not be_empty
      end
    end
    
    
  end


end
