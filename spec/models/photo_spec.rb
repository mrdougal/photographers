require 'spec_helper'

describe Photo do
  
  before(:all) do
    @photo = Factory :photo
  end
  
  # We need to cleanup after ourselves, overwise the uploads dir gets very messy
  after(:all) do
    @photo.destroy
  end
  
  describe "file" do
    
    before(:each) do
      @photo = Photo.new(Factory.attributes_for :photo, :file => nil )
    end
    
    it "should require a file" do
      @photo.save
      @photo.should have(1).error_on(:file)
    end
  end

  describe "compatible images (jpg, png)" do
  
    it "should have a filename" do
      @photo.file_file_name.should_not be_blank
    end
    
    it "should have a filename" do
      @photo.file_file_name.should == 'portrait.png'
    end
  
    it "should have a content-type" do
      @photo.file_content_type.should == 'image/png'
    end

  end
  
  describe "incompatible image formats (psd, pdf)" do
   
    before(:all) do
      @bad_photo = Photo.new Factory.attributes_for(:photo, :file => File.new(File.join(fixture_path, 'photos','text.txt')))
    end
    
    after(:all) do
      @bad_photo.destroy
    end
    
    it "should reject the file" do
      
      @bad_photo.save
      @bad_photo.should have(1).error_on(:file)
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
    
    
    context "with categories" do
      
      before(:each) do
        @photo.update_attribute :category_list, 'Cheese, Ham'
      end
      
      it "should have categories" do
        @photo.categories.should_not be_empty
      end
    end
    
    
    context "with sets" do
      
      before(:each) do
        @photo.update_attribute :set_list, 'Cheese, Ham'
      end
      
      it "should have sets" do
        @photo.sets.should_not be_empty
      end
    end
    
  end

  describe "name" do
    
    it "should contains it's filename" do
      @photo.name.should =~ /#{@photo.file_file_name}/
    end

    it "should not be blank" do
      @photo.name.should_not be_blank
    end
  end



end
