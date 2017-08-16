Feature: Wip

  @wip
  Scenario Outline: Logins using different access levels;
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
      | Fields            | Value             |
      | TenantFirstName   | auto              |
      | TenantLastName    | test              |
      | wtTenantPhone     |        2432343434 |
      | TenantBSB         |            123123 |
      | TenantAcctNum     |         123123123 |
      | TenantAccountName | OneTwoThree       |
      | TenantEmail       | tenant@tenant.com |
    Then I enter the details as
      | Fields              | Value             |
      | LessorFirstName     | auto              |
      | LessorLastName      | test              |
      | LessorPhone         |        2432343434 |
      | LessorBSB           |            123123 |
      | LessorAccountNumber |         123123123 |
      | LessorAccountName   | OneTwoThree       |
      | LessorEmail         | Lessor@tenant.com |
    Then I click on button with value "Next"
    Then I check I am on "Bond Lodgement Summary" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                          |
      | item1 | Bond Lodgement Summary                                            |
      | item2 | Rented Premise Details                                            |
      | item3 | Bond and Tenancy Details                                          |
      | item4 | Tenant Details                                                    |
      | item5 | Managing Agent Details                                            |
      | item6 | Lessor Details                                                    |
      | item7 | I confirm that these details are correct at the time of lodgement |
    And I click on "I confirm that these details are correct at the time of lodgement" checkbox
    Then I click on button with value "Next"
    Then I check I am on "Bond Lodgement Confirmation" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                               |
      | item1 | Lodgement Complete                     |
      | item2 | BACK TO BONDS                          |
      | item2 | You have successfully lodged your Bond |
    Then I click on button with value "View Payment Info"
    Then I check I am on "Bond Payment View" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                                   |
      | item1 | Direct Deposit                                                             |
      | item3 | ACT Rental Bonds                                                           |
      | item4 | 263-562                                                                    |
      | item5 | 263-562                                                                    |
      | item6 | 1928 4435 55                                                               |
      | item7 | On clicking Submit, these bonds will be marked as |
      #Scenario 2
      Then I click on button with value "Cancel"
      Then I check I am on "Bond Lodgement Confirmation" page
      #Scenario 3
       Then I click on button with value "View Payment Info"
    Then I check I am on "Bond Payment View" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                                   |
      | item1 | Direct Deposit                                                             |
      | item3 | ACT Rental Bonds                                                           |
      | item4 | 263-562                                                                    |
      | item5 | 263-562                                                                    |
      | item6 | 1928 4435 55                                                               |
      | item7 | On clicking Submit, these bonds will be marked as |
      Then I click on button with value "Submit"
      Then I check I am on "ManageBonds" page

      

    Examples: 
      | PortalName | email                     | Password   | Message                                  |
      | ARB        | FirstAgentOne@agency1.com | Support123 | Invalid login details. Please try again. |
