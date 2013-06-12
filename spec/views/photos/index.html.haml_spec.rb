require 'spec_helper'

describe "photos/index" do
  before(:each) do
    assign(:users, [
        stub_model(User,
                   :id => 1,
                   :username => "fritz",
                   :email => "fritz@fh-salzburg.ac.at"
        )
    ])
    assign(:photos, [
        stub_model(Photo,
                   :url => "Url",
                   :description => "MyText",
                   :user_id => 1,
                   :created_at => Time.now
        ),
        stub_model(Photo,
                   :url => "Url",
                   :description => "MyText",
                   :user_id => 1,
                   :created_at => Time.now
        )
    ])
  end

  it "renders a list of photos" do
    render

    assert_select ".photo .description", :text => "MyText".to_s, :count => 2
  end
end
