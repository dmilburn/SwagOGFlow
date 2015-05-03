feature 'Search' do
  let(:question) { FactoryGirl.build :question }
  context "Searching from root page" do
    it "should display search bar" do
      visit root_path
      expect(page).to have_button("Search")
    end


  end
end