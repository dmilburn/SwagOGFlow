require 'spec_helper'

feature 'New Question' do
  let(:user) { User.create(name: "username", password: '123', password_confirmation: '123')}
  context "Adding tags" do
    it "should display the tags field to add tags" do
      stub_current_user(user)
      stub_authorize_user!
      visit new_question_path
      expect(page).to have_content "Tags"
    end
    it "can create a new question with tags and view it" do
       stub_current_user(user)
       visit new_question_path
       expect {
         fill_in "question[title]",   with: "Title"
         fill_in "question[body]", with: "SwagOGFlow Question"
         fill_in "question[string_of_tags]", with: "Awesome Cool"
         click_button 'Create Question'
       }.to change(Question, :count).by(1)
       expect(page).to have_content "Your question has been posted!"
       expect(page).to have_content "Awesome Cool"
     end

  end
end