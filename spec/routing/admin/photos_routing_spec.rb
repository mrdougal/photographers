require 'spec_helper'

describe Admin::PhotosController do

  describe "routing" do
    it "recognizes and generates #edit" do
      { :get => "/admin/photos/1/edit" }.should route_to(:controller => "admin/photos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/admin/photos" }.should route_to(:controller => "admin/photos", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/admin/photos/1" }.should route_to(:controller => "admin/photos", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admin/photos/1" }.should route_to(:controller => "admin/photos", :action => "destroy", :id => "1") 
    end
  end
  
  describe "disabled routes" do
    
    it "should not recognize #index" do
      { :get => "/admin/photos" }.should_not be_routable
    end

    it "should not recognize#new" do
      { :get => "/admin/photos/new" }.should_not be_routable
    end

    it "should not recognize #show" do
      { :get => "/admin/photos/1" }.should_not be_routable
    end

  end
end
