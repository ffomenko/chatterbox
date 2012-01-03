Feature: Add Posts
  In order to let others know what is happening
  As a User of Chatterbox
  I want to add new post

  Scenario: Adding New post with poster and body
    Given I am on post index page
    And I follow "new post"
    And I fill in "Poster" with "Fedor"
    And I fill in "Body" with "Let us stop Noosphere pollution"
    And I press "add post"
    Then I should see "Post was successfully added."
    And I should see "Let us stop Noosphere pollution"

  Scenario: Adding New post without poster and body
    Given I am on post index page
    And I follow "new post"
    And I press "add post"
    Then I should not see "Post was successfully added."
    And I should see "Body can't be blank"
    And I should see "Poster can't be blank"

  Scenario: Adding New post without body
    Given I am on post index page
    And I follow "new post"
    And I fill in "Poster" with "Fedor"
    And I press "add post"
    Then I should not see "Post was successfully added."
    And I should see "Body can't be blank"

  Scenario: Adding New post with image
    Given I am on post index page
    And I follow "new post"
    And I fill in "Poster" with "Fedor"
    And I fill in "Body" with "Image Caption"
    And I attach image "sample.jpg"
    And I press "add post"
    Then I should see "Post was successfully added."
    And I should see image "sample.jpg"
