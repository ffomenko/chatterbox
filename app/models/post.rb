class Post < ActiveRecord::Base
  validates :body, :presence => true
  validates :poster, :presence => true

  has_attached_file :image,
                    :styles => { :medium => "300x300>" },
                    :path => ":id/:style/:basename.:extension",
                    :storage => :s3,
                    :s3_credentials => { :access_key_id     => ENV['S3_KEY'],
                                         :secret_access_key => ENV['S3_SECRET']},
                    :bucket => "ffchatterbox"
  validates_attachment_content_type :image, :content_type=>['image/jpeg', 'image/png']
end
