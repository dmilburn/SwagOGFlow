feature 'Sort by Tags' do
  let!(:user) { User.create(name: "username", password: '123', password_confirmation: '123')}
  let!(:question) {user.questions.create(title: "question_title", body: "question_body")}
    context "Navigate from index page to tags page" do
    it "should display the list of tags link" do
      visit root_path
      expect(page).to have_content("List of tags")
    end
    it "should redirect to the tags index page" do
      question.tags.create(name: "tag_name")
      visit root_path
      click_on "List of tags"
      expect(page).to have_content "tag_name"
    end
    it "should redirect to a page with the questions containing the tag you click" do
      question.tags.create(name: "tag_name")
      visit root_path
      click_on "List of tags"
      click_on "tag_name"
      expect(page).to have_content "question_title"
    end
  end
end