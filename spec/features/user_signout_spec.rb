require 'spec_helper'

RSpec.feature "User Sign Out", :type => :feature do

  let!(:user) { User.create(name: "username", password: 'password', password_confirmation: 'password')}

  scenario "A user can sign out" do
    page.set_rack_session(user_id: user.id)
    visit root_path
    click_on "username"
    click_on "Sign out"
    expect(page).to have_content("Logged out!")
  end
end