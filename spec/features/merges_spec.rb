require 'spec_helper'

describe "the merging process", :type => :feature do

  it "returns error if no photo was selected" do
    make_user_and_login

    visit new_photo_path
    within("#new_photo") do
      fill_in 'Description', :with => 'A nice test description.'
      #attach_file 'Url', 'test/img/photo2.jpg'
    end
    click_button 'Create Photo'
    page.should have_content "Please select a photo that you would like to merge."
  end


  it "can merge photos" do
    make_user_and_login

    visit new_photo_path
    within("#new_photo") do
      fill_in 'Description', :with => 'A nice test description.'
      attach_file 'Url', 'test/img/photo2.jpg'
    end
    click_button 'Create Photo'
    page.should have_content "Photo was successfully created."
    

  end

end
