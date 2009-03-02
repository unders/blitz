Feature: Rails controller generator
  In order to better do Test-Driven Development with Rails
  As a user
  I want to generate Shoulda & Factory Girl tests for only RESTful action I need.

  Scenario: Controller generator for index action
    Given a Rails app
    And the coulda plugin is installed
    When I generate a "Posts" controller with "index" action
    Then a standard "index" functional test for "posts" should be generated
    And an empty "index" controller action for "posts" should be generated

  Scenario: Controller generator for new action
    Given a Rails app
    And the coulda plugin is installed
    When I generate a "Posts" controller with "new" action
    Then a standard "new" functional test for "posts" should be generated
    And a "new" controller action for "posts" should be generated

