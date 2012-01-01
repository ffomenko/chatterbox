require 'spec_helper'

describe "posts/edit.html.erb" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :poster => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path(@post), :method => "post" do
      assert_select "input#post_poster", :name => "post[poster]"
      assert_select "textarea#post_body", :name => "post[body]"
    end
  end
end
