require 'spec_helper'

describe PostPublisher do

  describe "publish_post_create" do

    before do
      @testee = double("controller")
      @testee.extend PostPublisher
      @post = double("post")
      @channel = double("channel")
      @post_html = "post html"
    end

    it "should render post into string and pass it to pusher" do
      @testee.should_receive(:render_to_string).with(:partial => 'post', :layout => false, :locals => {:post => @post}).and_return(@post_html)
      Pusher.should_receive(:[]).with('post-channel').and_return(@channel)
      @channel.should_receive(:trigger).with('post_create', @post_html)
      @testee.publish_post_create(@post)
    end

  end

end