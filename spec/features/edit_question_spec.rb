require 'spec_helper'

RSpec.feature "Question Editing", :type => :feature do

  let(:user) { User.create(name: "username", password: '123', password_confirmation: '123')}

  scenario "A user cannot view the edit form on questions they have not created" do
    user.questions.create(title: "Testing Questions",
                         body: "SwagOGFlow Question")
    visit root_path
    click_on "Testing Questions"
    expect(page).not_to have_content "Edit Question"
  end

  scenario "A user can view the edit form on questions they have created" do
    user.questions.create(title: "Testing Questions",
                         body: "SwagOGFlow Question")
    stub_current_user(user)
    visit root_path
    click_on "Testing Questions"
    click_on "Edit Question"
    expect(page).to have_content "Edit Question"
    expect(page).to have_content "Title"
  end

  scenario "A user edit questions they have created" do
    user.questions.create(title: "Testing Questions",
                         body: "SwagOGFlow Question")
    stub_current_user(user)
    visit root_path
    click_on "Testing Questions"
    click_on "Edit Question"
    fill_in "question_title", :with => "Testing Questions Edit"
    fill_in "question_body", :with => "SwagOGFlow Question Edit"
    click_on "Update Question"
    expect(page).to have_content "Testing Questions Edit"
    expect(page).to have_content "SwagOGFlow Question Edit"
  end

end