require 'spec_helper'

describe PostsController do

  render_views

  describe "GET index" do

    before do
      @new_post = Factory.create(:post, :created_at => DateTime.civil(2012, 1, 1, 16, 0, 0))
      @old_post = Factory.create(:post, :created_at => DateTime.civil(2012, 12, 31, 17, 0, 0))
    end

    it "assigns all posts in reverse chronological order to @posts" do
      get :index
      assigns(:posts).should eq([@old_post, @new_post])
    end
  end

  describe "GET new" do
    it "assigns a new post as @post" do
      get :new
      assigns(:post).should be_a_new(Post)
    end
  end

  describe "POST create" do

    describe "with valid params" do

      it "creates a new Post and redirects to index" do
        expect { post :create, :post => Factory.attributes_for(:post) }.to change(Post, :count).by(1)
        response.should redirect_to(posts_path)
      end

    end

    #describe "with invalid params" do
    #  it "assigns a newly created but unsaved post as @post" do
    #    # Trigger the behavior that occurs when invalid params are submitted
    #    Post.any_instance.stub(:save).and_return(false)
    #    post :create, :post => {}
    #    assigns(:post).should be_a_new(Post)
    #  end
    #
    #  it "re-renders the 'new' template" do
    #    # Trigger the behavior that occurs when invalid params are submitted
    #    Post.any_instance.stub(:save).and_return(false)
    #    post :create, :post => {}
    #    response.should render_template("new")
    #  end
    #end
  end

end
