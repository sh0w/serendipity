require 'spec_helper'

describe "photos/index" do
  before(:each) do
    assign(:photos, [
      stub_model(Photo,
        :url => "Url",
        :description => "MyText",
        :user_id => 1
      ),
      stub_model(Photo,
        :url => "Url",
        :description => "MyText",
        :user_id => 1
      )
    ])
  end

  it "renders a list of photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    #assert_select ".container", :text =, :count => 2
    assert_select ".container", :text => "MyText".to_s, :count => 2
    assert_select ".container", :text => 1.to_s, :count => 2
  end
end
