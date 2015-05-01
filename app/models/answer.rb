class Answer < ActiveRecord::Base
  has_many :responses, as: :respondable
  has_many :votes, as: :votable
  belongs_to :question
  belongs_to :user

  def count_votes
    vote_count = 0
    self.votes.each do |vote|
      vote_count += vote.value
    end
    vote_count
  end
end