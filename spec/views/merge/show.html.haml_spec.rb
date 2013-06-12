require 'spec_helper'

describe "merges/show" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :url => "Url",
      :description => "MyText",
      :user_id => 1
    ))
  end

  it "displays the merged image" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    #rendered.should match(/Url/)
    #rendered.should match(/MyText/)
    #rendered.should match(/1/)
  end

  it "shows original images, and links to their users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    #rendered.should match(/Url/)
    #rendered.should match(/MyText/)
    #rendered.should match(/1/)
  end
end
