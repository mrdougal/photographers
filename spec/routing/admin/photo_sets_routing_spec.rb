require 'spec_helper'

describe Admin::PhotoSetsController do

  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/admin/categories/1/sets" }.should route_to( :controller => "admin/photo_sets", 
                                                              :category_id => "1", 
                                                              :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/admin/categories/1/sets/new" }.should route_to( :controller => "admin/photo_sets", 
                                                                  :category_id => "1", 
                                                                  :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/admin/categories/1/sets/2" }.should route_to( :controller => "admin/photo_sets", 
                                                              :category_id => "1", 
                                                              :action => "show", 
                                                              :id => "2")
    end

    it "recognizes and generates #show" do
      { :get => "/admin/categories/1/sets/2" }.should route_to( :controller => "admin/photo_sets", 
                                                                :action => "show", 
                                                                :category_id => "1",
                                                                :id => "2")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin/categories/1/sets/2/edit" }.should route_to(:controller => "admin/photo_sets", 
                                                                  :action => "edit", 
                                                                  :category_id => "1", 
                                                                  :id => "2")
    end
    
  end

  describe "disabled routing" do
    
    it "should not recognize /admin/sets" do
      { :get => "/admin/sets" }.should_not be_routable
    end

    it "should not recognize /admin/photo_sets" do
      { :get => "/admin/photo_sets" }.should_not be_routable
    end

  end

end
