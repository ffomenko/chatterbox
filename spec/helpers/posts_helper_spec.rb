require 'spec_helper'

describe PostsHelper do

  describe "post_signature" do

    context "for post with created_at set" do

      it "returns string with post age from Time.now and poster" do
        post = Factory.build(:post, :poster => "Fedor", :created_at => Time.now)
        helper.should_receive(:time_ago_in_words).with(post.created_at).and_return("less than a minute")
        helper.post_signature(post).should == "Posted less than a minute ago by Fedor."
      end

    end

    context "for post with nil created_at set" do

      it "returns empty string" do
        post = Factory.build(:post, :poster => "Fedor", :created_at => nil)
        helper.post_signature(post).should == ""
      end

    end

  end

end
