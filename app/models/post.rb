class Post < ActiveRecord::Base
  validates :body, :presence => true
  validates :poster, :presence => true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type=>['image/jpeg', 'image/png']
end
