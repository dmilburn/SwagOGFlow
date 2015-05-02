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

  def string_of_tags
    self.tags.map { |tag| tag.name }.join(" ")
  end

  def create_tags(array_of_tags)
    array_of_tags.each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name)
      tag.question_tags.create(question_id: self.id)
    end
  end

  def remove_tags(array_of_tags)
    array_of_tags.each do |tag_name|
      tag = Tag.find_by(name: tag_name)
      self.question_tags.find_by(tag_id: tag.id).destroy
    end
  end

end