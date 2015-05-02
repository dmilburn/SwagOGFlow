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

  end
end