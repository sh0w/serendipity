require 'spec_helper'

describe "merges/show" do
  before(:each) do
    @first_photo = assign(:photo, stub_model(Photo,
                                       :url => "Url",
                                       :description => "MyText",
                                       :user_id => 1,
                                       :id => 1
    ))
    @second_photo = assign(:photo, stub_model(Photo,
                                       :url => "Url",
                                       :description => "MyText",
                                       :user_id => 1,
                                       :id => 2
    ))
    @merge = assign(:merge, stub_model(Merge,
                                       :url => "Url",
                                       :first_photo => 1,
                                       :second_photo => 2
    ))
  end

  it "displays the merged image" do
    render

  end

  it "shows original images, and links to their users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    #rendered.should match(/Url/)
    #rendered.should match(/MyText/)
    #rendered.should match(/1/)
  end
end
