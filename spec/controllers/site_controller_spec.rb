require 'spec_helper'

describe SiteController do


  describe "photos" do
    
    before(:all) do
      @photos = Factory :photo, :name => "cheese", :tag_list => "bacon" 
    end
    
    after(:all) do
      @photos.destroy
    end
   
    it "renders the photos template" do
      get :photos
      response.should render_template('photos')
    end
    
    it "renders the photo template" do
      get :photo, :permalink => "cheese" 
      response.should render_template('photo')
    end
    
    it "renders 404 if the photo doesn't exists" do
      get :photo, :permalink => "non-existant"
      response.should render_template('shared/rescues/not_found') 
    end

    
    it "renders the photos tagged template (as there are photos tagged with the term)" do
      get :photos_tagged, :tag => "bacon" 
      response.should render_template('photos_tagged')
    end
    
    it "render empty (as there are no photo tagged with our term)" do
      get :photos_tagged, :tag => "cheese"
      response.should render_template('photos_tagged_empty') 
    end
    
  end


  describe "other resources" do

    describe "homepage" do
      it "renders the homepage template" do
        get :homepage
        response.should render_template('homepage')
      end
    end

    describe "about" do
      it "renders the about template" do
        get :about
        response.should render_template('about')
      end
    end
  
    describe "contact" do
      it "renders the contact template" do
        get :contact
        response.should render_template('contact')
      end
    end    
  end

end
