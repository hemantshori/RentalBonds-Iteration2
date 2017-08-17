Feature: Wip

  @wip
  Scenario Outline: ABR-124 As an RBU Team Leader, I want to view a list of users within the RBU and ACT Housing so that I know who can access the portal
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
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName   |
      | item1 | First Name |
      | item3 | Last Name  |
      | item4 | Email      |
      | item5 | Role       |
      | item6 | Status     |
      Then I "click" text "Nitin" displayed in table "MainContent"
    And I see popup "MainContent" displayed

    Examples: 
      | PortalName | email                         | Password   |
      | ARB        | backofficeteamleader@test.com | Support123 |

  Scenario Outline: ABR-149 As a Logged in user, I want to search for a Bonds so that I can quickly find the Bond I needAs an RBU Team Leader, I want to view a list of users within the RBU and ACT Housing so that I know who can access the portal
    # Lodge a bond
    Given I want to login to portal "<PortalName>"
    And I wait for "2000" milliseconds
    And I check I am on "Login" page
    And I enter the details as
      | Fields   | Value      |
      | Email    | <email>    |
      | Password | <Password> |
    And I hit Enter
    And I check I am on "ManageBonds" page
    Then I see the table "MainContent" displayed
    Then I "click" text "BOND NO" displayed in table "MainContent"

    Examples: 
      | PortalName | email                | Password   |
      | ARB        | agentadmin2@test.com | Support123 |
      #| ARB        | lessor1@test.com               | Support123 |
      #| ARB        | agentadmin2@test.com           | Support123 |
      #| ARB        | backofficeteamleader2@test.com | Support123 |
      #| ARB        | agentadmin2@test.com           | Support123 |
