require 'spec_helper'
describe Tag do
  let!(:question) {Question.create(title: "Stuck", body: "Need Help")}
  let(:tag) { FactoryGirl.build :tag }
  it "should have a name" do
    expect(tag.name).to eq "test_tag"
  end
  it "can be assigned to a question through belongs to association" do
    expect {
      question.tags << tag
      }.to change {question.tags.count}.from(0).to(1)
  end
end