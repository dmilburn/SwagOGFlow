require 'spec_helper'

RSpec.feature "Question Viewing", :type => :feature do

  let(:user) { User.create(name: "username", password: '123', password_confirmation: '123')}

  scenario "A user can see questions on the root path" do
    user.questions.create(title: "Testing Questions",
                         body: "SwagOGFlow Question")
    visit root_path
    expect(page).to have_content "Testing Questions"
  end

  scenario "A user can click on a question and view its body" do
    user.questions.create(title: "Testing Questions",
                          body: "SwagOGFlow Question Body")
    visit root_path
    click_on "Testing Questions"
    expect(page).to have_content "SwagOGFlow Question Body"
  end
end