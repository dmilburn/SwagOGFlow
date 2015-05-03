class Vote < ActiveRecord::Base
  before_save :set_user
  belongs_to :voter, class_name: "User"
  belongs_to :votable, polymorphic: true


end