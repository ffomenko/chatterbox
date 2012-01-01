Then /^I should see posts displayed in reverse chronological order$/ do
  @old_post = model("post: \"old_post\"")
  @fresh_post = model("post: \"fresh_post\"")
  page.body.should =~ /#{@fresh_post.body}.*#{@old_post.body}/m
end

Then /^each post should show body with correct signature$/ do
  page.body.should =~ /#{@fresh_post.body}.*Posted less than a minute ago by Sofia/m
  page.body.should =~ /#{@old_post.body}.*Posted 1 day ago by Fedor/m
end


