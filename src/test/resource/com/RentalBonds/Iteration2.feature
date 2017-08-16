Feature: Iteration 1 tests

  #DONE: ARB-333
  @wip
  Scenario Outline: Bond Payment and Receipt
    Given I want to login to portal "<PortalName>"
    And I wait for "2000" milliseconds
    And I check I am on "Login" page
    And I enter the details as
      | Fields   | Value      |
      | Email    | <email>    |
      | Password | <Password> |
    And I hit Enter
    And I check I am on "ManageBonds" page
    And I click on text "Agent One"
    Then I click on text "Lodge Bond"
    Then I check I am on "Bond Lodgement Premise" page
    #Scenario 1: User accesses the ‘Lodge Bond’ function
    Then I see text "Section and Block information can be found on your Rates notice" displayed
    And I enter the details as
      | Fields             | Value                               |
      | OneLineAddress     | 10 FLORA AVE, BADGER CREEK VIC 3777 |
      | NumberOfBedrooms   |                                  11 |
      | TotalBondAmount    |                                 100 |
      | WeeklyRentalAmount |                                 100 |
    Then I select "Separated House" from "DwellingType"
    Then I click on button with value "Next"
    Then I check I am on "Bond Step2" page
    Then I enter the details as
      | Fields            | Value               |
      | TenantEmail       | tukeelaina@nono.com |
      | TenantFirstName   | auto                |
      | TenantLastName    | test                |
      | wtTenantPhone     |          2432343434 |
      | TenantBSB         |              123123 |
      | TenantAcctNum     |           123123123 |
      | TenantAccountName | OneTwoThree         |
    Then I enter the details as
      | Fields            | Value               |
      | LessorEmail       | tukeelaina@nono.com |
      | LessorFirstName   | auto                |
      | LessorLastName    | test                |
      | LessorPhone       |          2432343434 |
      | LessorBSB         |              123123 |
      | LessorAcctNum     |           123123123 |
      | LessorAccountName | OneTwoThree         |
    Then I click on button with value "Next"

    Examples: 
      | PortalName | email                     | Password   | Message                                  |
      | ARB        | FirstAgentOne@agency1.com | Support123 | Invalid login details. Please try again. |
