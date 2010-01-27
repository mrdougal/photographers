require 'spec_helper'

describe Admin::PhotosController do

  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/admin/photos" }.should route_to(:controller => "admin/photos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/admin/photos/new" }.should route_to(:controller => "admin/photos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/admin/photos/1" }.should route_to(:controller => "admin/photos", :action => "show", :id => "1")
    end

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
end
