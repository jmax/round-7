require 'spec_helper'

describe "/personas/show.html.erb" do
  include PersonasHelper
  before(:each) do
    assigns[:persona] = @persona = stub_model(Persona,
      :full_name => "value for full_name",
      :age => 1,
      :email => "value for email",
      :active => false
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ full_name/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/false/)
  end
end
