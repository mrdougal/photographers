require 'spec_helper'

describe PhotosController do

  # Since all we're really testing for here, is that we're rendering views
  integrate_views true

  before(:all) do
    @photos = Factory :photo, :name => "cheese", :tag_list => "bacon" 
  end
  
  after(:all) do
    @photos.destroy
  end
 
  it "renders the photos template" do
    get :index
    response.should render_template('index')
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
      get :tagged, :tag => "bacon" 
      response.should render_template('tagged')
    end
  
    it "render empty (as there are no photo tagged with our term)" do
      get :tagged, :tag => "cheese"
      response.should render_template('tagged_empty') 
    end
  end

  describe "sets" do

    it "renders the set template (if there are photos within the set)" do
      
      pending
      # get :set, :permalink => "ham" 
      # response.should render_template('set')
    end
  
    it "renders empty (as there is no set with that name)" do
      get :set, :permalink => "ham-cheese"
      response.should render_template('set_empty') 
    end
    
  end

end
