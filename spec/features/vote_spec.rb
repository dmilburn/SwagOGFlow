require 'spec_helper'

feature 'Voting' do
  let(:user) { User.create(name: "username", password: '123', password_confirmation: '123')}
  context "Signed in user can vote" do
    it "should allow a user to upvote a question only once" do
      stub_current_user(user)
      visit root_path
      click_on("Upvote")
      expect(page).to have_content "1"
    end
    it "should not allow the same user to vote on the same question again" do
      stub_current_user(user)
      visit root_path
      click_on("Upvote")
      expect(page).to have_content "1"
    end
  end
end