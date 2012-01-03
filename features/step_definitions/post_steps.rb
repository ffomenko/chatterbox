Then /^I should see "([^"]*)" followed by "([^"]*)"$/ do |post1, post2|
  p1 = model("post: \"#{post1}\"")
  p2  = model("post: \"#{post2}\"")
  page.body.should =~ /#{p1.body}.*#{p2.body}/m
end

Then /^I should see "([^"]*)" body followed by "([^"]*)"$/ do |post, signature|
  p = model("post: \"#{post}\"")
  page.body.should =~ /#{p.body}.*#{signature}/m
end

Then /^I should see image "([^"]*)"$/ do |file|
  page.body.should have_xpath("//div[@class='post']//img[contains(@src, \"#{file}\")]")
end

Then /^I should not see missing image$/ do
  page.body.should_not have_xpath("//div[@class='post']//img")
end

Given /^user "([^"]*)" is on post index page$/ do |user|
  using_session(user) do
    step %{I am on post index page}
  end
end

Given /^I attach image "([^"]*)"$/ do |file|
  attach_file('Image', File.expand_path("#{Rails.root}/features/fixtures/images/#{file}"))
end


When /^"([^"]*)" adds a new post with poster: "([^"]*)", body: "([^"]*)"$/ do |user, poster, body|
  using_session(user) do
    step %{I follow "new post"}
    step %{I fill in "Poster" with "#{poster}"}
    step %{I fill in "Body" with "#{body}"}
    step %{I press "add post"}
  end
end

When /^I should see "([^"]*)" followed by "([^"]*)" without refreshing the page$/ do |body, signature|
  page.body.should =~ /#{body}.*#{signature}/m
end


