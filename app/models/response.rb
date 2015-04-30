class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :respondable, polymorphic: true
end