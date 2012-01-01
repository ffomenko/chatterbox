module PostsHelper

  def post_signature(post)
    post.created_at ? "Posted #{time_ago_in_words(post.created_at)} ago by #{post.poster}." : ""
  end

end
