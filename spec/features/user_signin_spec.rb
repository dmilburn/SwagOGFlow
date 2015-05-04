require 'spec_helper'

RSpec.feature "User Sign Up", :type => :feature do
  scenario "A user can access the sign in page" do
    visit signin_path
    expect(page).to have_content("Name")
    expect(page).to have_content("Password")
  end

  scenario "A successful sign in redirects to the root" do
    User.create(name: "test_user",
                password: "password",
                password_confirmation: "password")
    visit root_path
    click_on "Sign In"
    fill_in "session[name]", :with => "test_user"
    fill_in "session[password]", :with => "password"
    click_on "Sign in"
    expect(page).to have_content("Logged in!")
  end

  scenario "An unsuccessful sign in reloads the sign in form" do
    User.create(name: "test_user",
                password: "password",
                password_confirmation: "password")
    visit root_path
    click_on "Sign In"
    fill_in "session[name]", :with => "test_user"
    fill_in "session[password]", :with => "not_password"
    click_on "Sign in"
    expect(page).to have_content("Invalid username or password")
  end
end