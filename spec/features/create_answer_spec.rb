require 'spec_helper'

RSpec.feature 'Answers' do

  let(:user) { User.create(name: "username", password: '123', password_confirmation: '123')}

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
end