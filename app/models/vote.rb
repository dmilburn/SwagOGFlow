class Vote < ActiveRecord::Base
  before_save :set_user
  belongs_to :voter, class_name: "User"
  belongs_to :votable, polymorphic: true

  def set_user
    self.voter_id = current_user.id
  end
end