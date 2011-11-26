Feature: Sign in
  As a registered user
  I want to sign in
  So I can be recognised by the site

  Scenario: Sign in
    Given I am registered as 'Fred'
    When I sign in
    Then I should be signed in

  Scenario: Sign in unregistered
    When I sign in as 'Fred'
    Then I should be signed out

  Scenario: Sign in with bad password
    Given I am registered as 'Fred'
    When I sign in with a bad password
    Then I should be signed out

  Scenario: Sign in with bad email
    Given I am registered as 'Fred'
    When I sign in with a bad email
    Then I should be signed out

    
