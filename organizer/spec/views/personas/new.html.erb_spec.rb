require 'spec_helper'

describe "/personas/new.html.erb" do
  include PersonasHelper

  before(:each) do
    assigns[:persona] = stub_model(Persona,
      :new_record? => true,
      :full_name => "value for full_name",
      :age => 1,
      :email => "value for email",
      :active => false
    )
  end

  it "renders new persona form" do
    render

    response.should have_tag("form[action=?][method=post]", personas_path) do
      with_tag("input#persona_full_name[name=?]", "persona[full_name]")
      with_tag("input#persona_age[name=?]", "persona[age]")
      with_tag("input#persona_email[name=?]", "persona[email]")
      with_tag("input#persona_active[name=?]", "persona[active]")
    end
  end
end
