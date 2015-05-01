require 'spec_helper'

RSpec.feature "User Sign Ip", :type => :feature do
  scenario "A user can access the sign in page" do
    visit signin_path
    expect(page).to have_content("Name")
    expect(page).to have_content("Password")
  end

  scenario "A successful sign in redirects to the root" do
    User.create(name: "test_user",
                password: "password",
                password_confirmation: "password")
    visit signin_path
    fill_in "session_name", :with => "test_user"
    fill_in "session_password", :with => "password"
    click_on "Save Session"
    expect(page).to have_content("Logged in!")
  end
end