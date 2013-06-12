require 'spec_helper'

describe "photos/new" do
  before(:each) do
    assign(:photo, stub_model(Photo,
      :url => "MyString",
      :description => "MyText",
      :user_id => 1,
      :created_at => Time.now
    ).as_new_record)
  end

  it "renders new photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", photos_path, "post" do
      assert_select "input#photo_url[name=?]", "photo[url]"
      assert_select "textarea#photo_description[name=?]", "photo[description]"
      assert_select "input#photo_user_id[name=?]", "photo[user_id]", false, "should not have a user id form element!"
    end
  end
end
