require 'spec_helper'

RSpec.feature "User Sign Up", :type => :feature do
  scenario "A user can access the signup page" do
    visit signup_path
    expect(page).to have_content("Name")
    expect(page).to have_content("Password")
    expect(page).to have_content("Password confirmation")
  end

  scenario "A successful signup redirects to the root page" do
    visit signup_path
    fill_in "user_name", :with => "test_user"
    fill_in "user_password", :with => "password"
    fill_in "user_password_confirmation", :with => "password"
    click_on "Create User"
    expect(page).to have_content("Sign Out")
  end

end