require 'spec_helper'

describe "the merging process", :type => :feature do
  before :each do
    #User.create!(:email => 'user@example.com', :password => 'password')
  end

  it "uploads a new photo" do
    visit new_photo_path
    within("#new_photo") do
      fill_in 'Login', :with => 'user@example.com'
      fill_in 'Description', :with => 'A nice test description.'
    end
    click_button 'Sign in'
    page.should have_content 'Signed in successfully.'
  end

  xit "shows error message when i use a wrong password" do
    visit new_user_session_path
    within("#new_user") do
      fill_in 'Login', :with => 'user@example.com'
      fill_in 'Password', :with => 'this is a wrong password'
    end
    click_button 'Sign in'
    page.should have_content 'Invalid'
    page.should have_content 'password'
  end

  xit "shows error message when i use a wrong password" do
    visit new_user_session_path
    within("#new_user") do
      fill_in 'Login', :with => 'fasfsanfks sa fjsakfaskf@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Sign in'
    page.should have_content 'Invalid'
    page.should have_content 'login'
  end



end
