require 'spec_helper'

describe PhotoSetsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/photo_sets" }.should route_to(:controller => "photo_sets", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/photo_sets/new" }.should route_to(:controller => "photo_sets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/photo_sets/1" }.should route_to(:controller => "photo_sets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/photo_sets/1/edit" }.should route_to(:controller => "photo_sets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/photo_sets" }.should route_to(:controller => "photo_sets", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/photo_sets/1" }.should route_to(:controller => "photo_sets", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/photo_sets/1" }.should route_to(:controller => "photo_sets", :action => "destroy", :id => "1") 
    end
  end
end
