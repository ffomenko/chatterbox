Feature: View Posts
  In order to see what is happening
  As a User of Chatterbox
  I want to see existing posts displayed in reverse chronological order Post Content, Poster Name, and when it was Posted calculated from now

  Scenario: View Posts
    Given a post "old_post" exists with poster: "Fedor", body: "Chatterbox Old Post", created_at: "#{Time.now - 1.day}"
    Given a post "fresh_post" exists with poster: "Sofia", body: "Chatterbox Fresh Post", created_at: "#{Time.now}"
    And I am on post index page
    Then I should see "fresh_post" followed by "old_post"
    And I should see "fresh_post" body followed by "Posted less than a minute ago by Sofia"
    And I should see "old_post" body followed by "Posted 1 day ago by Fedor"

  @javascript
  Scenario: View Posts created by someone else in real time
    Given I am on post index page
    And user "Sofia" is on post index page
    When "Sofia" adds a new post with poster: "Sofia", body: "New Post"
    And I should see "New Post" followed by "Posted less than a minute ago by Sofia" without refreshing the page
