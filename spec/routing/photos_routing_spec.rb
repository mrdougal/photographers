require 'spec_helper'

describe PhotosController do

  describe "routing" do
    
      it "recognises and generates params for #photos" do
        { :get => "/photos" }.should route_to(:controller => "photos", :action => "index")
      end

      it "recognises and generates params for #tagged" do
        { :get => "/photos/tagged/cheese" }.should route_to(:controller => "photos", :action => "tagged", :tag => "cheese" )
      end

      it "recognises and generate params for #sets" do
        { :get => "/photos/sets/bacon" }.should route_to(:controller => "photos", :action => "set", :permalink => "bacon" )
      end
      it "recognises and generates params for #photo" do
        { :get => "/photos/ham" }.should route_to(:controller => "photos", :action => "show", :permalink => "ham" )
      end
    

  end
end
