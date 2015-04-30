User
 has_many :questions
 has_many :answers
 has_many :responses
 has_many :votes

Question
 has_many :answers
 has_many :responses, as: :respondable
 has_many :question_tags
 has_many :tags, through: :question_tags
 has_many :votes, as: :votable
 belongs_to :user

Answer
 has_many :responses, as: :respondable
 has_many :votes, as: :votable
 belongs_to :question
 belongs_to :user

Response (type: question or answer)
  belongs_to :user
  belongs_to :respondable, polymorphic: true

QuestionsTag
  belongs_to :question
  belongs_to :tag

Tag
  has_many :question_tags
  has_many :questions, through: :question_tags

Vote (type: question or answer)
  belongs_to :voter, source: :user
  belongs_to :votable, polymorphic: true


