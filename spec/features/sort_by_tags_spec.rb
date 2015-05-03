feature 'Sort by Tags' do
  context "Navigate from index page to tags page" do
    it "should display the list of tags link" do
      visit root_path
      expect(page).to have_content("List of tags")
    end

  end
end