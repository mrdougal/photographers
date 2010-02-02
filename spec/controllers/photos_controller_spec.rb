require 'spec_helper'

describe PhotosController do

  # Since all we're really testing for here, is that we're rendering views
  integrate_views true

  before(:all) do
    @photos = [
      Factory(:photo, :name => "cheese", :tag_list => "tasty"),
      Factory(:photo, :name => "bacon", :tag_list => "tasty")
       ]
  end
  
  after(:all) do
    Photo.destroy_all
  end
 
  describe "index" do
    
    it "renders the photos template" do
      get :index
      response.should render_template('index')
    end
  end
 
  describe "show" do
    
    it "renders the photo template" do
      get :show, :permalink => "cheese" 
      response.should render_template('show')
    end
  
    it "renders 404 if the photo doesn't exists" do
      get :show, :permalink => "non-existant"
      response.should render_template('shared/rescues/not_found') 
    end
  end
  
  describe "tagged" do
    
    it "renders the tagged template (as there are photos tagged with the term)" do
      get :tagged, :tag => "tasty" 
      response.should render_template('tagged')
    end
  
    it "render empty (as there are no photo tagged with our term)" do
      get :tagged, :tag => "cheese"
      response.should render_template('tagged_empty') 
    end
  end

  describe "sets" do
    
    describe "no sets" do
      
      it "renders empty from @sets" do
        get :sets
        response.should render_template('shared/rescues/not_found')
      end
    end
    
    
    describe "with existing set" do
      
      before(:each) do
        @set = Factory :photo_set, :name => "ham" 
      end
      
      it "renders empty from @set" do
        get :set, :permalink => "ham" 
        response.should render_template('set_empty')
      end
      
      it "renders @sets" do
        get :sets
        response.should render_template('sets')
      end
      
      describe "set with photos" do
        before(:each) do
          @photos.first.update_attribute :photo_set, @set
        end
      
        it "renders the set template (as there are photos within the set)" do
          get :set, :permalink => "ham" 
          response.should render_template('set')
        end
      end
      
    end
    
  
    it "renders empty (as there is no set with that name)" do
      get :set, :permalink => "non-existant"
      response.should render_template('shared/rescues/not_found') 
    end
    
  end

end
