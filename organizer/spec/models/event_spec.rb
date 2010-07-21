require 'spec_helper'

describe Event do
  def mock_event_attributes
    { :title => 'Titulo del evento', :description => 'Hola!', :finished_on => 3.days.from_now.to_date }
  end

  before(:each) do
    @event = Event.new
  end

  context 'structure' do
    it "should be able to store title" do
      @event.should respond_to(:title)
      @event.should respond_to(:title=)
    end

    it "should be able to store description" do
      @event.should respond_to(:description)
      @event.should respond_to(:description=)
    end

    it "should be able to store finished_on" do
      @event.should respond_to(:finished_on)
      @event.should respond_to(:finished_on=)
    end
  end

  context 'validations' do
    it { @event.should validate_presence_of(:title) }
    it { @event.should validate_presence_of(:description) }
    it { @event.should validate_uniqueness_of(:title) }

    context 'with valid data' do
      before(:each) do
        @event.attributes = mock_event_attributes
      end

      it { @event.should be_valid }
    end
  end

  context 'helpers' do
    context 'finished?' do
      it "should identify an event that is finished" do
        @event.finished_on = Date.today
        @event.should be_finished
        @event.finished_on = 3.days.ago.to_date
        @event.should be_finished
      end
    end
  end
end

