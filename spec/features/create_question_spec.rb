require 'spec_helper'

feature 'New Question' do
  let(:user) { User.create(name: "username", password: '123', password_confirmation: '123')}
  context "A user can create a new question" do
    it "should allow you to create tags" do
      stub_authorize_user!
      visit new_question_path
      expect(page).to have_content "Tags"
    end
  end
end