require 'spec_helper'

describe "/personas/index.html.erb" do
  include PersonasHelper

  before(:each) do
    assigns[:personas] = [
      stub_model(Persona,
        :full_name => "value for full_name",
        :age => 1,
        :email => "value for email",
        :active => false
      ),
      stub_model(Persona,
        :full_name => "value for full_name",
        :age => 1,
        :email => "value for email",
        :active => false
      )
    ]
  end

  it "renders a list of personas" do
    render
    response.should have_tag("tr>td", "value for full_name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end
