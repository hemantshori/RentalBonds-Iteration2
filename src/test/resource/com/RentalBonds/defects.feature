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
     Examples: 
      | PortalName | email                     | Password   |
      | ARB        | backofficeteamleader@test.com  | Support123 |