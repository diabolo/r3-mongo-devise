Feature: Register
  As a site owner
  I want users to register
  So I can establish stronger relationships with my users

  Scenario: Register
    Given I am Fred
    When I register
    Then I should be registered
