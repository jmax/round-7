require 'spec_helper'

describe Persona do
  before(:each) do
    @valid_attributes = {
      :full_name => "value for full_name",
      :age => 1,
      :email => "value for email",
      :active => false
    }
  end

  it "should create a new instance given valid attributes" do
    Persona.create!(@valid_attributes)
  end
end
