Feature: View Posts
  In order to see the watch is happening
  As a User of Chatterbox
  I want to see existing posts displayed in reverse chronological order Post Content, Poster Name, and when it was Posted calculated from now

  Scenario: View Posts
    Given a post "old_post" exists with poster: "Fedor", body: "Chatterbox Old Post", created_at: "#{Time.now - 1.day}"
    Given a post "fresh_post" exists with poster: "Sofia", body: "Chatterbox Fresh Post", created_at: "#{Time.now}"
    And I am on post index page
    Then I should see posts displayed in reverse chronological order
    And each post should show body with correct signature
