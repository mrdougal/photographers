require 'spec_helper'

describe SiteController do

  describe "routing" do
    
    it "recognises the homepage" do
      { :get => "/" }.should route_to(:controller => "site", :action => "homepage")
    end

    it "recognises and generates params for #photos" do
      { :get => "/photos" }.should route_to(:controller => "site", :action => "photos")
    end

    it "recognises and generates params for #photo" do
      { :get => "/photos/1" }.should route_to(:controller => "site", :action => "photo", :permalink => "1" )
    end
    
    it "recognises and generates params for #tagged" do
      { :get => "/photos/tagged/1" }.should route_to(:controller => "site", :action => "tagged_photos", :tag => "1" )
    end
    
    it "recognises #about" do
      { :get => "/about" }.should route_to(:controller => "site", :action => "about")
    end
    
    it "recognised #contact" do
      { :get => "/contact" }.should route_to(:controller => "site", :action => "contact" )
    end

  end
end
