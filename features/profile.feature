Feature: Profile
  As a registered user
  I want access to my profile
  So I can change/view my details

  Scenario: View profile
    Given I am registered as 'Fred'
    When I sign in
    And I view my profile
    Then I should see my profile
