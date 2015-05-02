require 'spec_helper'
describe Tag do
   let(:tag) { FactoryGirl.build :tag }
   it "" do
     expect {
      tag.save
    }.to
  end