require 'spec_helper'

describe PhotosController do

  describe "routing" do
    
      describe "index" do
        
        it "recognises and generates params" do
          { :get => "/photos" }.should route_to(:controller => "photos", :action => "index")
        end
      
        it "recognises and generate params with pagination" do
          { :get => "/photos/page/2" }.should route_to(:controller => "photos", :action => "index", :page => "2" )
        end
      end
      
      describe "tagged" do

        it "recognises and generates params for tags" do
          { :get => "/photos/tagged" }.should route_to(:controller => "photos", :action => "tags" )
        end

        it "recognises and generates params for tagged" do
          { :get => "/photos/tagged/cheese" }.should route_to(:controller => "photos", :action => "tagged", :tag => "cheese" )
        end
        
        it "recognises and generate params for tagged with pagination" do
          { :get => "/photos/tagged/cheese/page/2" }.should route_to( :controller => "photos", 
                                                                      :action => "tagged", 
                                                                      :tag => "cheese", 
                                                                      :page => "2" )
        end
      end

      describe "sets" do
        
        it "recognised and generates params for #sets" do
          { :get => "/photos/sets" }.should route_to(:controller => "photos", :action => "sets" )
        end

        it "recognised and generates params for #sets with pagination" do
          { :get => "/photos/sets/page/2" }.should route_to(:controller => "photos", :action => "sets", :page => "2" )
        end

        
        it "recognises and generate params for #set" do
          { :get => "/photos/sets/bacon" }.should route_to(:controller => "photos", :action => "set", :permalink => "bacon" )
        end
      end

      describe "show" do
        
        it "recognises and generates params for #photo" do
          { :get => "/photos/ham" }.should route_to(:controller => "photos", :action => "show", :permalink => "ham" )
        end
      end

  end
end
