class Answer < ActiveRecord::Base
 has_many :responses, as: :respondable
 has_many :votes, as: :votable
 belongs_to :question
 belongs_to :user
end