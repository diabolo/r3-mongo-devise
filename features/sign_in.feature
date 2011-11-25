Feature: Sign in
  As a registered user
  I want to sign in
  So I can be recognised by the site

  Scenario: Sign in
    Given I am registered as 'Fred'
    When I sign in
    Then I should be signed in
