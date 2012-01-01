require 'spec_helper'

describe "posts/new.html.erb" do
  before(:each) do
    assign(:post, stub_model(Post,
      :poster => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path, :method => "post" do
      assert_select "input#post_poster", :name => "post[poster]"
      assert_select "textarea#post_body", :name => "post[body]"
    end
  end
end
