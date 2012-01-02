

module PostPublisher

  Pusher.app_id = '12846'
  Pusher.key = '1d22c5da4cc342fbf2ac'
  Pusher.secret = '68a91f8ba83a9b21b578'

  def publish_post_create(post)
    @post_template = render_to_string(:partial => 'post', :layout => false, :locals => {:post => post})
    Pusher['post-channel'].trigger('post_create', @post_template)
  end

end