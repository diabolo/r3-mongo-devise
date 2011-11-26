Feature: Sign up
  As a site owner
  I want users to sign up
  So I can establish stronger relationships with my users

  Scenario: Sign up
    Given I am Fred
    When I sign up
    Then I should be registered

  Scenario: Sign up with malformed email
    Given I am Fred
    When I sign up with a malformed email
    Then I should see malformed email error

  Scenario: Sign up with no name
    Given I am Fred
    When I sign up with no name
    Then I should see no name error
    
