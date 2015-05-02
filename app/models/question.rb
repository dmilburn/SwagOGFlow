class Question < ActiveRecord::Base
 has_many :answers
 has_many :responses, as: :respondable
 has_many :question_tags
 has_many :tags, through: :question_tags
 has_many :votes, as: :votable
 belongs_to :user

  def count_votes
    vote_count = 0
    self.votes.each do |vote|
      vote_count +=  vote.value
    end
    vote_count
  end

  def tag_list
    self.tags.map { |t| t.name }.join(", ")
  end
end