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


 describe "pagination title" do
   
   describe "failsafe" do
     
     it "should throw argument error if passed nothing" do
       
       lambda { pagination_title }.should raise_error(ArgumentError)
       
     end
     
     it "should return nil if not passed a collection" do
       pagination_title('').should == nil
     end
   
     it "should return nil if passed a plain array" do
       pagination_title([]).should == nil
     end
     
   end 
   
   describe "one page of records" do
     
     it "should return nothing" do
       pagination_title(mock_model(Array, { 
         :total_pages => 1, 
         :current_page => 1 })).should == nil
     end
     
   end
   
   describe "mulitple pages" do
     
     (1..10).each do |p|
       
       it "should return 'page #{p} of 10'" do
         pagination_title(mock_model(Array, { :total_pages => 10, 
                                              :current_page => p })).should == "page #{p} of 10"
       end
     end
   end
   
 end

end
