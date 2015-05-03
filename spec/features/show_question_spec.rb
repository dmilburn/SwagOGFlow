require 'spec_helper'

RSpec.feature "Question Viewing", :type => :feature do
  scenario "A user can see questions on the root path" do
    user = User.create(name: "test_user",
                  password: "password",
                  password_confirmation: "password")
    user.questions.create(title: "Testing Questions",
                         body: "SwagOGFlow Question")
    visit root_path
    expect(page).to have_content "Testing Questions"
  end

  scenario "A user can click on a question and view its body" do
    user = User.create(name: "test_user",
                  password: "password",
                  password_confirmation: "password")
    user.questions.create(title: "Testing Questions",
                          body: "SwagOGFlow Question Body")
    visit root_path
    click_on "Testing Questions"
    expect(page).to have_content "SwagOGFlow Question Body"
  end
end