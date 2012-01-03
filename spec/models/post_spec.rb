require 'spec_helper'

describe Post do

  describe "Validations" do
    it { should validate_presence_of :body }
    it { should validate_presence_of(:poster) }
    it { should validate_attachment_content_type(:image).allowing('image/png', 'image/jpeg').rejecting('text/plain', 'text/xml') }
  end

end
