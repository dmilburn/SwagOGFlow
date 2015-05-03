require 'spec_helper'
describe Answer do
  let!(:question) {Question.create(title: "Stuck", body: "Need Help")}
  let(:answer) { FactoryGirl.build :answer }
  it "should have a body" do
    expect(answer.body).to eq "test_answer"
  end
  it "can be assigned to a question through belongs to association" do
    expect {
      question.answers << answer
      }.to change {question.answers.count}.from(0).to(1)
  end
  it "should have a default selected value of false" do
    expect(answer.selected).to eq false
  end
end