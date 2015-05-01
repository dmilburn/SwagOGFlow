require 'spec_helper'

RSpec.feature "User Sign Out", :type => :feature do
  scenario "A user can sign out" do
    User.create(name: "test_user",
                password: "password",
                password_confirmation: "password")
    visit signin_path
    fill_in "session_name", :with => "test_user"
    fill_in "session_password", :with => "password"
    click_on "Save Session"
    click_on "Sign out"
    expect(page).to have_content("Logged out!")
  end
end