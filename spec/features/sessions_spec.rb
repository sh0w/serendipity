require 'spec_helper'

describe "the signup process", :type => :feature do
  before :each do
    User.create!(:email => 'user@example.com', :password => 'password')
  end

  it "signs me in" do
    visit new_user_session_path
    within("#new_user") do
      fill_in 'Login', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Sign in'
    page.should have_content 'Signed in successfully.'
  end

  it "shows error message when i use a wrong password" do
    visit new_user_session_path
    within("#new_user") do
      fill_in 'Login', :with => 'user@example.com'
      fill_in 'Password', :with => 'this is a wrong password'
    end
    click_button 'Sign in'
    page.should have_content 'Invalid'
    page.should have_content 'password'
  end

  it "shows error message when i use a wrong password" do
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
