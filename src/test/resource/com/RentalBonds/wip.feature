Feature: Wip

  @wip
  Scenario Outline: ABR-375 As an Agent Administrator, I want to resend the activation email so that the user can activate their account and login to the portal
    Given I want to login to portal "<PortalName>"
    And I wait for "2000" milliseconds
    And I check I am on "Login" page
    And I enter the details as
      | Fields   | Value      |
      | Email    | <email>    |
      | Password | <Password> |
    And I hit Enter
    And I check I am on "ManageBonds" page
    And I click on text "Manage Users"
    Then I check I am on "UserList" page
    Then I see the table "MainContent" displayed
    Then I "click" text "ujaad" displayed in table "MainContent"
    And I see popup "MainContent" displayed
    And I wait for "2000" milliseconds
    # Scenario 1
    And I switch to frame "0"
    Then I see text "RESEND ACTIVATION EMAIL" displayed
    And I click on text "RESEND ACTIVATION EMAIL"

    Examples: 
      | PortalName | email                | Password   | Message                                  |
      | ARB        | agentadmin2@test.com | Support123 | Invalid login details. Please try again. |
