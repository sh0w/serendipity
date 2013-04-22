require 'spec_helper'

describe "photos/show" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :url => "Url",
      :description => "MyText",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    #render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    #rendered.should match(/Url/)
    #rendered.should match(/MyText/)
    #rendered.should match(/1/)
  end
end
