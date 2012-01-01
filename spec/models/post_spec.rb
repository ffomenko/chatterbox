require 'spec_helper'

describe Post do

  describe "Validations" do
    it { should validate_presence_of :body }
    it { should validate_presence_of(:poster) }
  end

end
