require 'spec_helper'

RSpec.feature "User Sign Up", :type => :feature do
  scenario "A user can access the signup page" do
    visit signup_path
    expect(page).to have_content("Name")
    expect(page).to have_content("Password")
    expect(page).to have_content("Password confirmation")
  end
end