require 'spec_helper'

describe EventsController do

  before(:each) do
    @event  = mock_model(Event)
    @events = [@event]
    Event.stub!(:all).and_return(@events)
    Event.stub!(:find).and_return(@event)
  end

  context 'index page' do
    it "should collect all events" do
      Event.should_receive(:all).and_return(@events)
      get :index
    end

    it "should assign events" do
      get :index
      assigns[:events].should == @events
    end

    it "should render index page" do
      get :index
      response.should render_template('events/index')
    end
  end

  context 'detail page' do
    it "should find requested event" do
      Event.should_receive(:find).with('1').and_return(@event)
      get :show, :id => '1'
    end

    it "should assign requested event" do
      get :show, :id => '1'
      assigns[:event].should == @event
    end

    it "should render detail page" do
      get :show, :id => '1'
      response.should render_template('events/show')
    end
  end

end

