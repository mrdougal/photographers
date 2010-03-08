require 'spec_helper'

describe PhotoSetsController do

  def mock_photo_set(stubs={})
    @mock_photo_set ||= mock_model(PhotoSet, stubs)
  end

  describe "GET index" do
    it "assigns all photo_sets as @photo_sets" do
      PhotoSet.stub(:find).with(:all).and_return([mock_photo_set])
      get :index
      assigns[:photo_sets].should == [mock_photo_set]
    end
  end

  describe "GET show" do
    it "assigns the requested photo_set as @photo_set" do
      PhotoSet.stub(:find).with("37").and_return(mock_photo_set)
      get :show, :id => "37"
      assigns[:photo_set].should equal(mock_photo_set)
    end
  end

  describe "GET new" do
    it "assigns a new photo_set as @photo_set" do
      PhotoSet.stub(:new).and_return(mock_photo_set)
      get :new
      assigns[:photo_set].should equal(mock_photo_set)
    end
  end

  describe "GET edit" do
    it "assigns the requested photo_set as @photo_set" do
      PhotoSet.stub(:find).with("37").and_return(mock_photo_set)
      get :edit, :id => "37"
      assigns[:photo_set].should equal(mock_photo_set)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created photo_set as @photo_set" do
        PhotoSet.stub(:new).with({'these' => 'params'}).and_return(mock_photo_set(:save => true))
        post :create, :photo_set => {:these => 'params'}
        assigns[:photo_set].should equal(mock_photo_set)
      end

      it "redirects to the created photo_set" do
        PhotoSet.stub(:new).and_return(mock_photo_set(:save => true))
        post :create, :photo_set => {}
        response.should redirect_to(photo_set_url(mock_photo_set))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved photo_set as @photo_set" do
        PhotoSet.stub(:new).with({'these' => 'params'}).and_return(mock_photo_set(:save => false))
        post :create, :photo_set => {:these => 'params'}
        assigns[:photo_set].should equal(mock_photo_set)
      end

      it "re-renders the 'new' template" do
        PhotoSet.stub(:new).and_return(mock_photo_set(:save => false))
        post :create, :photo_set => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested photo_set" do
        PhotoSet.should_receive(:find).with("37").and_return(mock_photo_set)
        mock_photo_set.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :photo_set => {:these => 'params'}
      end

      it "assigns the requested photo_set as @photo_set" do
        PhotoSet.stub(:find).and_return(mock_photo_set(:update_attributes => true))
        put :update, :id => "1"
        assigns[:photo_set].should equal(mock_photo_set)
      end

      it "redirects to the photo_set" do
        PhotoSet.stub(:find).and_return(mock_photo_set(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(photo_set_url(mock_photo_set))
      end
    end

    describe "with invalid params" do
      it "updates the requested photo_set" do
        PhotoSet.should_receive(:find).with("37").and_return(mock_photo_set)
        mock_photo_set.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :photo_set => {:these => 'params'}
      end

      it "assigns the photo_set as @photo_set" do
        PhotoSet.stub(:find).and_return(mock_photo_set(:update_attributes => false))
        put :update, :id => "1"
        assigns[:photo_set].should equal(mock_photo_set)
      end

      it "re-renders the 'edit' template" do
        PhotoSet.stub(:find).and_return(mock_photo_set(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested photo_set" do
      PhotoSet.should_receive(:find).with("37").and_return(mock_photo_set)
      mock_photo_set.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the photo_sets list" do
      PhotoSet.stub(:find).and_return(mock_photo_set(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(photo_sets_url)
    end
  end

end
