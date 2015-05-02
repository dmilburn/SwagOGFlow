require 'spec_helper'
describe QuestionsController do
  context "#index" do
    it "redirects successfully to the index view" do
      get :index
      expect(response).to be_success
    end
  end
end