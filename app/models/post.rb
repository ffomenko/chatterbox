class Post < ActiveRecord::Base
  validates :body, :presence => true
  validates :poster, :presence => true
end
