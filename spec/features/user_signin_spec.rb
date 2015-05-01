require 'spec_helper'

RSpec.feature "User Sign Ip", :type => :feature do
  scenario "A user can access the sign in page" do
    visit signin_path
    expect(page).to have_content("Name")
    expect(page).to have_content("Password")
  end
end