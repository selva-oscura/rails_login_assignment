class Comment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :author, :content
  validates :author, :content, :user_id, :presence => true
end