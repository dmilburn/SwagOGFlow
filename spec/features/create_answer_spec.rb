require 'spec_helper'

RSpec.feature 'Answers' do

  let(:user) { User.create(name: "username", password: 'password', password_confirmation: 'password')}

  scenario "should allow a logged in user to answer a question" do
    stub_current_user(user)
    user.questions.create(title: "Testing Questions",
                   body: "SwagOGFlow Question")
    visit root_path
    click_on "Testing Questions"
    fill_in "answer_body", :with => "This is a test answer"
    click_on "Create Answer"
    expect(page).to have_content "This is a test answer"
  end

  scenario "should allow a question owner to mark answer as the correct answer" do
    stub_current_user(user)
    question = user.questions.create(title: "Testing Questions",
                                     body: "SwagOGFlow Question")
    question.answers.create(body: "Test Answer")
    visit root_path
    click_on "Testing Questions"
    click_on "Mark this answer as correct"
    expect(page).to have_css("img[src*='assets']")
  end

end