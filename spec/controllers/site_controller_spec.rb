require 'spec_helper'

describe SiteController do


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
