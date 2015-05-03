require 'spec_helper'

RSpec.feature "Question Editing", :type => :feature do
  scenario "A user cannot view the edit form on questions they have not created" do
    user = User.create(name: "test_user",
                  password: "password",
                  password_confirmation: "password")
    user.questions.create(title: "Testing Questions",
                         body: "SwagOGFlow Question")
    visit root_path
    click_on "Testing Questions"
    expect(page).not_to have_content "Edit Question"
  end
end