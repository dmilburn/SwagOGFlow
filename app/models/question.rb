class Question < ActiveRecord::Base
 has_many :answers
 has_many :responses, as: :respondable
 has_many :question_tags
 has_many :tags, through: :question_tags
 has_many :votes, as: :votable
 belongs_to :user

 def count_votes

 end
end