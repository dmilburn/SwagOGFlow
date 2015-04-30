class Vote < ActiveRecord::Base
  belongs_to :voter, source: :user
  belongs_to :votable, polymorphic: true
end