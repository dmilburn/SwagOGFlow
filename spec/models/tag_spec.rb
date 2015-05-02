require 'spec_helper'
describe Tag do
  let(:tag) { FactoryGirl.build :tag }
  it "should have a name" do
    expect(tag.name).to eq "test_tag"
  end
end