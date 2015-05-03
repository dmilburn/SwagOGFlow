feature 'Search' do
  let!(:user) { User.create(name: "username", password: '123', password_confirmation: '123')}
  context "Searching from root page" do

    it "should display search bar" do
      visit root_path
      expect(page).to have_button("Search")
    end
    it "should allow you to search for complete strings in question titles and bodies" do
      user.questions.create(title: "question_title", body: "question_body")
       visit root_path
       fill_in "search",   with: "question_body"
       click_button "Search"
       expect(page).to have_content "question_title"
     end


  end
end