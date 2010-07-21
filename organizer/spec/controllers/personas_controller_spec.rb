require 'spec_helper'

describe PersonasController do

  def mock_persona(stubs={})
    @mock_persona ||= mock_model(Persona, stubs)
  end

  describe "GET index" do
    it "assigns all personas as @personas" do
      Persona.stub(:find).with(:all).and_return([mock_persona])
      get :index
      assigns[:personas].should == [mock_persona]
    end
  end

  describe "GET show" do
    it "assigns the requested persona as @persona" do
      Persona.stub(:find).with("37").and_return(mock_persona)
      get :show, :id => "37"
      assigns[:persona].should equal(mock_persona)
    end
  end

  describe "GET new" do
    it "assigns a new persona as @persona" do
      Persona.stub(:new).and_return(mock_persona)
      get :new
      assigns[:persona].should equal(mock_persona)
    end
  end

  describe "GET edit" do
    it "assigns the requested persona as @persona" do
      Persona.stub(:find).with("37").and_return(mock_persona)
      get :edit, :id => "37"
      assigns[:persona].should equal(mock_persona)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created persona as @persona" do
        Persona.stub(:new).with({'these' => 'params'}).and_return(mock_persona(:save => true))
        post :create, :persona => {:these => 'params'}
        assigns[:persona].should equal(mock_persona)
      end

      it "redirects to the created persona" do
        Persona.stub(:new).and_return(mock_persona(:save => true))
        post :create, :persona => {}
        response.should redirect_to(persona_url(mock_persona))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved persona as @persona" do
        Persona.stub(:new).with({'these' => 'params'}).and_return(mock_persona(:save => false))
        post :create, :persona => {:these => 'params'}
        assigns[:persona].should equal(mock_persona)
      end

      it "re-renders the 'new' template" do
        Persona.stub(:new).and_return(mock_persona(:save => false))
        post :create, :persona => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested persona" do
        Persona.should_receive(:find).with("37").and_return(mock_persona)
        mock_persona.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :persona => {:these => 'params'}
      end

      it "assigns the requested persona as @persona" do
        Persona.stub(:find).and_return(mock_persona(:update_attributes => true))
        put :update, :id => "1"
        assigns[:persona].should equal(mock_persona)
      end

      it "redirects to the persona" do
        Persona.stub(:find).and_return(mock_persona(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(persona_url(mock_persona))
      end
    end

    describe "with invalid params" do
      it "updates the requested persona" do
        Persona.should_receive(:find).with("37").and_return(mock_persona)
        mock_persona.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :persona => {:these => 'params'}
      end

      it "assigns the persona as @persona" do
        Persona.stub(:find).and_return(mock_persona(:update_attributes => false))
        put :update, :id => "1"
        assigns[:persona].should equal(mock_persona)
      end

      it "re-renders the 'edit' template" do
        Persona.stub(:find).and_return(mock_persona(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested persona" do
      Persona.should_receive(:find).with("37").and_return(mock_persona)
      mock_persona.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the personas list" do
      Persona.stub(:find).and_return(mock_persona(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(personas_url)
    end
  end

end
