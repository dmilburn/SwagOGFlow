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
      self.tags.find_or_create_by(name: tag_name)
    end
  end

  def remove_tags(array_of_tags)
    array_of_tags.each do |tag_name|
      tag = Tag.find_by(name: tag_name)
      self.question_tags.find_by(tag_id: tag.id).destroy
    end
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ? or body LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end