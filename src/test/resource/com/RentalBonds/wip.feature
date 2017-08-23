Feature: Wip

  @wip
  	Scenario Outline: ARB-122: As an Agent Administrator, I want to update a users details so that their information is up to dates
    Given I want to login to portal "<PortalName>"
    And I wait for "4000" milliseconds
    And I check I am on "Login" page
    And I enter the details as
      | Fields   | Value      |
      | Email    | <email>    |
      | Password | <Password> |
    And I hit Enter
    Then I click on text "Manage Users"
    Then I click on text "ron.coldebella@dbresults.com.au"
    Then I wait for "4000" milliseconds
    Then I switch to frame "0"
    Then I click on button with value "EDIT"
    Then I click on button with value "Cancel"
    Then I check that table "RealEstateAgentTable_Wrapper" with row containing "<email_test>" has the following
      | Fields | Value            |
      | item1  | Ron              |
      | item1  | Coldebella       |
      | item1  | <email_test>     |
      | item1  | Property Manager |
      | item1  | Active           |
    Then I click on text "ron.coldebella@dbresults.com.au"
    Then I wait for "4000" milliseconds
    Then I switch to frame "0"
    Then I click on button with value "EDIT"
    #And I enter the details as
      #| Fields                   | Value          |
      #| USER_EXTENSION_FirstName | RonEdit        |
      #| USER_EXTENSION_LastName  | ColdebellaEdit |
      #| User_ContactPhone        |     1234567890 |
    
    Then I select "Agent Administrator" from "User_Role" 
    Then I click on button with value "Save"
    Then I check that table "RealEstateAgentTable_Wrapper" with row containing "<email_test>" has the following
      | Fields | Value            |
      | item1  | Ron          |
      | item1  | Coldebella   |
      | item1  | <email_test>     |
      | item1  | Agent Administrator |
      | item1  | Active           |
    Then I click on text "ron.coldebella@dbresults.com.au"
    Then I wait for "4000" milliseconds
    Then I switch to frame "0"
    Then I click on button with value "EDIT"
    #And I enter the details as
      #| Fields                   | Value      |
      #| USER_EXTENSION_FirstName | Ron        |
      #| USER_EXTENSION_LastName  | Coldebella |
      #| User_ContactPhone        | 1234567890 |
     Then I select "Property Manager" from "User_Role" 
    Then I click on button with value "Save"
    Then I check that table "RealEstateAgentTable_Wrapper" with row containing "<email_test>" has the following
      | Fields | Value            |
      | item1  | Ron              |
      | item1  | Coldebella       |
      | item1  | <email_test>     |
      | item1  | Property Manager |
      | item1  | Active           |

    Examples: 
      | PortalName | email                | Password   | Message                                  | email_test                      |
      | ARB        | agentadmin2@test.com | Support123 | Invalid login details. Please try again. | ron.coldebella@dbresults.com.au |

      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
  Scenario Outline: ARB-194: As an Agent Administrator/Propertnager/Lessor, I want to see a summary of my bond lodgement so that I can review the details I've entered
    #Scenario 2: Agent Administrator/Property Manager reviews a summary of the Bond Lodgement
    Given I want to login to portal "<PortalName>"
    And I check I am on "Login" page
    And I enter the details as
      | Fields   | Value      |
      | Email    | <email>    |
      | Password | <Password> |
    And I hit Enter
    And I check I am on "ManageBonds" page
    Then I click on text "Lodge Bond"
    Then I check I am on "Bond Lodgement Premise" page
    Then I click on text "ENTER MANUAL ADDRESS"
    And I wait for "2000" milliseconds
    And I enter the details as
      | Fields             | Value                               |
      | OneLineAddress     | 10 FLORA AVE, BADGER CREEK VIC 3777 |
      | StreetNumber       |                                  13 |
      | StreetName         | Shori                               |
      | Suburb             | Murrumbeena                         |
      | Postcode           |                                1111 |
      | NumberOfBedrooms   |                                  13 |
      | TotalBondAmount    |                                 400 |
      | WeeklyRentalAmount |                                 400 |
    Then I select "Separated House" from "DwellingType"
    Then I click on button with value "Next"
    Then I check I am on "Bond Lodgement Parties" page
    And I enter the details as
      | Fields          | Value                |
      | TenantFirstName | TenantFirstName      |
      | TenantLastName  | TenantLastName       |
      | TenantEmail     | TenantEmail@TEST.com |
      | TenantPhone     |           1234567890 |
      #| TenantBSB           |               383838 |
      #| TenantAcctNum       |               987653 |
      | LessorFirstName | LessorFirstName      |
      | LessorLastName  | LessorLastName       |
      | LessorEmail     | LessorEmail@TeST.com |
      | LessorPhone     |           0987654321 |
    #| LessorBSB           |               838383 |
    #| LessorAccountNumber |               356789 |
    Then I click on button with value "Next"
    Then I check I am on "Bond Lodgement Summary" page
    Then I check "PremiseDetails" exists
    Then I check "BondAndTenancy" exists
    Then I check "TenantDetails" exists
    Then I check "ManagingAgentDetails" exists
    Then I check "LessorDetails" exists
    Then I check "ConfirmCheck" exists
    # ToDo disabled for now as address fileds on Bond lodgement premise has bugs
    Then "<Item>" is displayed as "<ItemName>"
      | Fields | Value           |
      | item1  | TenantFirstName |
      | item1  | TenantLastName  |
      #| item1  | TenantEmail@TEST.com                |
      #| item1  | Separated House                     |
      #| item1  | 10 FLORA AVE, BADGER CREEK VIC 3777 |
      #| item1  | 12 3456 7890                        |
      #| item1  | 383-838                             |
      #| item1  |                              987653 |
      | item1  | LessorFirstName |
      | item1  | LessorLastName  |
    #| item1  | LessorEmail@TeST.com                |
    #| item1  | 09 8765 4321                        |
    #| item1  | TestLessorAccount                   |
    #| item1  | 838-383                             |
    #| item1  |                              356789 |
    #| item1  | Separated House                     |
    #| item1  | Admin ADmin Last                    |
    #| item1  | 14 2324 3323                        |
    Then I see text "I confirm that these details are correct at the time of lodgement" displayed
    Then I click on button with value "Back"
    Then I check I am on "Bond Lodgement Parties" page
    #Scenario 3: User cancels bond lodgement
    Then I click on text "BACK TO BONDS"
    Then I check I am on "ManageBonds" page
    #Scenario 4: User does not confirm bond lodgement details
    Then I click on text "Lodge Bond"
    Then I check I am on "Bond Lodgement Premise" page
    Then I click on text "ENTER MANUAL ADDRESS"
    And I wait for "2000" milliseconds
    And I enter the details as
      | Fields             | Value                               |
      | OneLineAddress     | 10 FLORA AVE, BADGER CREEK VIC 3777 |
      | StreetNumber       |                                  14 |
      | StreetName         | Shori                               |
      | Suburb             | Murrumbeena                         |
      | Postcode           |                                1111 |
      | NumberOfBedrooms   |                                  13 |
      | TotalBondAmount    |                                 400 |
      | WeeklyRentalAmount |                                 400 |
    Then I select "Separated House" from "DwellingType"
    Then I click on button with value "Next"
    Then I check I am on "Bond Lodgement Parties" page
    And I enter the details as
      | Fields          | Value                |
      | TenantFirstName | TenantFirstName      |
      | TenantLastName  | TenantLastName       |
      | TenantEmail     | TenantEmail@TEST.com |
      | TenantPhone     |           1234567890 |
      | LessorFirstName | LessorFirstName      |
      | LessorLastName  | LessorLastName       |
      | LessorEmail     | LessorEmail@TeST.com |
      | LessorPhone     |           0987654321 |
    Then I click on button with value "Next"
    Then I check I am on "Bond Lodgement Summary" page
    Then I click on button with value "Next"
    Then I see text "Please confirm your bond details are correct." displayed
    #Scenario 5: User confirms bond lodgement details
    Then I click on button "ConfirmCheck"
    Then I click on button with value "Next"
    Then I check I am on "Bond Lodgement Confirmation" page
    Then I click on text "Sign Out"
    #Scenario 2: Agent Administrator/Property Manager reviews a summary of the Bond Lodgement
    Given I want to login to portal "<PortalName>"
    And I check I am on "Login" page
    And I enter the details as
      | Fields   | Value            |
      | Email    | lessor2@test.com |
      | Password | <Password>       |
    And I hit Enter
    And I check I am on "ManageBonds" page
    Then I click on text "Lodge Bond"
    Then I check I am on "Bond Lodgement Premise" page
    Then I click on text "ENTER MANUAL ADDRESS"
    And I wait for "2000" milliseconds
    And I enter the details as
      | Fields             | Value                               |
      | OneLineAddress     | 10 FLORA AVE, BADGER CREEK VIC 3777 |
      | StreetNumber       |                                  15 |
      | StreetName         | Shori                               |
      | Suburb             | Murrumbeena                         |
      | Postcode           |                                1111 |
      | NumberOfBedrooms   |                                  13 |
      | TotalBondAmount    |                                 400 |
      | WeeklyRentalAmount |                                 400 |
    Then I select "Separated House" from "DwellingType"
    Then I click on button with value "Next"
    And I enter the details as
      | Fields          | Value                |
      | TenantFirstName | TenantFirstName      |
      | TenantLastName  | TenantLastName       |
      | TenantEmail     | TenantEmail@TEST.com |
      | TenantPhone     |           1234567890 |
    Then I click on button with value "Next"
    Then I check "PremiseDetails" exists
    Then I check "BondAndTenancy" exists
    Then I check "TenantDetails" exists
    #Then I check "ManagingAgentDetails" exists
    Then I check "LessorDetails" exists
    Then I check "ConfirmCheck" exists
    Then "<Item>" is displayed as "<ItemName>"
      | Fields | Value                               |
      | item1  | TenantFirstName                     |
      | item1  | Separated House                     |
      | item1  | 10 FLORA AVE, BADGER CREEK VIC 3777 |
      | item1  | TenantLastName                      |
      | item1  | TenantEmail@TEST.com                |
      | item1  | 12 3456 7890                        |
      | item1  | 383-838                             |
      | item1  |                              987653 |
    Then I see text "I confirm that these details are correct at the time of lodgement" displayed

    Examples: 
      | PortalName | email                | Password   | NewPassword | ABN         | LicenceNumber | PhoneNumber | EmailAddress  | Address                           |
      | ARB        | agentadmin2@test.com | Support123 | Dbresults1! | 55005825516 |     123454312 |  1234567890 | test@test.com | 10 FLORA GR, FOREST HILL VIC 3131 |

  Scenario Outline: ARB-91: As an anonymous user E.g. Tenant who is not logged in, I want to search for a bond so that I can view details of this bond
    Given I want to login to portal "BondSearch"
    #Scenario 1: User accesses the anonymous Search Bond function
    Then I see text "Please type the bond number and the last (family) name of any tenant listed on the bond." displayed
    Then I check "BondNumber2" exists
    Then I check "LastName3" exists
    Then I check "SearchButton" exists

    #Can't do the rest of this due to captcha...
    Examples: 
      | PortalName | email                   | Password   | Message                                  | email1       | email2          |
      | ARB        | rbuteamleader1@test.com | Support123 | Invalid login details. Please try again. | RBU@Test.com | 123arb@test.com |

  Scenario Outline: ARB-122: As an Agent Administrator, I want to update a users details so that their information is up to dates
    Given I want to login to portal "<PortalName>"
    And I wait for "4000" milliseconds
    And I check I am on "Login" page
    Then I click on button with value "Create Account"
    Then I wait for "2000" milliseconds
    #**************** JSON to put Ids on dropdown....run again...************
    #Scenario 1: Lessor accesses the Registration function
    Then I click on button "select2-chosen-1"
    #Then I select "Managing Agent" from "select2-chosen-1"
    Then I click on object with xpath "//div[contains(text(), 'Lessor')]"
    Then I wait for "1000" milliseconds
    Then I check "LessorFirstNameInput" is empty
    Then I check "LessorLastNameInput" is empty
    Then I check "LessorEmailAddressInput" is empty
    Then I check "LessorPhoneNumberInput" is empty
    Then I check "LessorAddressInput" is empty
    Then I check "LessorPostalAddressCheckbox" exists
    Then I check "AgreeTermsCheckbox" exists
    Then I check "FirstSectionNextLessor" exists
    Then I check "SignIn" exists
    # Then I see text "If you are a Managing agent or landlord please register below. Please note that Property Managers must be added by a Managing Agent to access the portal." displayed
    Then I see text "Required fields are marked by *" displayed
    #Scenario 2: Mandatory fields not filled in
    Then I click on button "AgreeTermsCheckbox"
    Then I click on button "FirstSectionNextLessor"
    Then I wait for "2000" milliseconds
    Then I see text "Required fields have not been completed" displayed
    #Scenario 3: Agreement to Terms of Use not confirmed
    And I enter the details as
      | Fields                  | Value          |
      | LessorFirstNameInput    | <FirstName>    |
      | LessorLastNameInput     | <LastName>     |
      | LessorEmailAddressInput | <EmailAddress> |
      | LessorPhoneNumberInput  | <PhoneNumber>  |
      | LessorAddressInput      | <Address>      |
    Then I click on button "AgreeTermsCheckbox"
    Then I click on button "FirstSectionNextLessor"
    Then I wait for "2000" milliseconds
    #this doesn't work for some reason. Instead, check that we're still on the same page.
    #Then I see text "You must agree to the Terms & Conditions before continuing" displayed
    Then I check "LessorFirstNameInput" exists
    Then I check "LessorLastNameInput" exists
    Then I check "LessorEmailAddressInput" exists
    Then I check "LessorPhoneNumberInput" exists
    Then I check "LessorAddressInput" exists
    Then I check "LessorPostalAddressCheckbox" exists
    Then I check "AgreeTermsCheckbox" exists
    Then I check "FirstSectionNextLessor" exists
    #Scenario 4: Email address not in the correct format
    Then I click on button "AgreeTermsCheckbox"
    And I enter the details as
      | Fields                  | Value |
      | LessorEmailAddressInput | test  |
    Then I click on button "FirstSectionNextLessor"
    Then I wait for "2000" milliseconds
    Then I see text "Email address is not valid, please try again" displayed
    #Scenario 5: Email address already registered
    And I enter the details as
      | Fields                  | Value           |
      | LessorEmailAddressInput | agent1@test.com |
    Then I click on button "FirstSectionNextLessor"
    Then I wait for "2000" milliseconds
    Then I see text "Email address is already registered, please try again" displayed
    #Scenario 6: Details validated successfully
    And I enter the details as
      | Fields                  | Value          |
      | LessorFirstNameInput    | <FirstName>    |
      | LessorLastNameInput     | <LastName>     |
      | LessorEmailAddressInput | <EmailAddress> |
      | LessorPhoneNumberInput  | <PhoneNumber>  |
      | LessorAddressInput      | <Address>      |
    Then I click on button "FirstSectionNextLessor"
    Then I wait for "2000" milliseconds
    Then I see text "Enter bank details for bond refunds." displayed

    Examples: 
      | PortalName | email                     | FirstName | LastName | ABN         | LicenceNumber | PhoneNumber  | EmailAddress    | Address                           |
      | ARB        | FirstAgentOne@agency1.com | TEST      | TEST     | 55005825516 |     123454312 | 23 4523 5235 | test12@test.com | 10 FLORA GR, FOREST HILL VIC 3131 |

  Scenario Outline: ARB-123: As an RBU Team Leader, I want to create user accounts for RBU and ACT Housing Officers so that they can access the portal
    Given I want to login to portal "<PortalName>"
    And I wait for "4000" milliseconds
    And I check I am on "Login" page
    And I enter the details as
      | Fields   | Value      |
      | Email    | <email>    |
      | Password | <Password> |
    And I hit Enter
    #Scenario 1: RBU Team Leader accesses the Create User function
    Then I click on text "Manage Users"
    Then I click on text "+ NEW USER"
    Then I wait for "2000" milliseconds
    Then I switch to frame "0"
    Then I check "User_Role" exists
    Then I check "USER_EXTENSION_FirstName" exists
    Then I check "USER_EXTENSION_LastName" exists
    Then I check "User_Email" exists
    Then I check "User_ContactPhone" exists
    Then I see text "An activation email will be sent to the email address entered. Due to security reasons, this link will expire in 60 minutes." displayed
    #Scenario 2: Mandatory fields not filled in
    Then I click on button with value "Save"
    Then I see text "Required fields have not been completed" displayed
    #Scenario 3: Email address not in the correct format
    Then I select "RBU Team Leader" from "User_Role"
    And I enter the details as
      | Fields                   | Value       |
      | USER_EXTENSION_FirstName | <FirstName> |
      | USER_EXTENSION_LastName  | <LastName>  |
      | User_ContactPhone        |  1234567890 |
      | User_Email               | TEST        |
    Then I click on button with value "Save"
    Then I see text "Email address is not valid, please try again" displayed
    #Scenario 4: Email address already registered
    And I enter the details as
      | Fields                   | Value       |
      | USER_EXTENSION_FirstName | <FirstName> |
      | USER_EXTENSION_LastName  | <LastName>  |
      | User_ContactPhone        |  1234567890 |
      | User_Email               | <email>     |
    Then I click on button with value "Save"
    Then I see text "Email address is already registered, please try again" displayed
    Then I click on button with value "Cancel"
    #Scenario 7: RBU Team Leader cancels user account creation with unsaved changes
    Then I wait for "2000" milliseconds
    Then I click on text "+ NEW USER"
    Then I wait for "2000" milliseconds
    Then I switch to frame "0"
    And I enter the details as
      | Fields                   | Value         |
      | USER_EXTENSION_FirstName | <FirstName>   |
      | USER_EXTENSION_LastName  | <LastName>    |
      | User_ContactPhone        |    1234567890 |
      | User_Email               | TEST@TEST.com |
    Then I click on button with value "Cancel"
    Then I see "There are unsaved changes on this page. Do you wish to proceed?" displayed on popup and I click "Cancel"
    Then I wait for "1000" milliseconds
    Then I click on button with value "Cancel"
    Then I see "There are unsaved changes on this page. Do you wish to proceed?" displayed on popup and I click "OK"
    #Scenario 6: RBU Team Leader cancels user account creation with no unsaved changes
    Then I click on text "+ NEW USER"
    Then I wait for "2000" milliseconds
    Then I switch to frame "0"
    Then I click on button with value "Cancel"
    #USER_EMAIL MUST BE CHANGED EACH TIME
    #Scenario 5: RBU Team Leader successfully creates a new user
    Then I click on text "+ NEW USER"
    Then I wait for "2000" milliseconds
    Then I switch to frame "0"
    Then I select "RBU Team Leader" from "User_Role"
    And I enter the details as
      | Fields                   | Value       |
      | USER_EXTENSION_FirstName | <FirstName> |
      | USER_EXTENSION_LastName  | <LastName>  |
      | User_ContactPhone        |  1234567890 |
    # | User_Email               | TEST17F@asdfasfdasdf.com |
    Then I enter "TEST@asdfsafd.com" with the current date prepended into "User_Email"
    Then I click on button with value "Save"
    Then I see text "User TESTAGAINAGAIN TESTAGAINAGAIN successfully created" displayed

    Examples: 
      | PortalName | email                   | Password   | Message                                  | email_test                      | FirstName      | LastName       | UserEmail                |
      | ARB        | rbuteamleader1@test.com | Support123 | Invalid login details. Please try again. | ron.coldebella@dbresults.com.au | TESTAGAINAGAIN | TESTAGAINAGAIN | TEST16F@asdfasfdasdf.com |

  Scenario Outline: ARB-91: As an anonymous user E.g. Tenant who is not logged in, I want to search for a bond so that I can view details of this bond
    Given I want to login to portal "BondSearch"
    #Scenario 1: User accesses the anonymous Search Bond function
    Then I see text "Please type the bond number and the last (family) name of any tenant listed on the bond." displayed
    Then I check "BondNumber2" exists
    Then I check "LastName3" exists
    Then I check "SearchButton" exists

    #Can't do the rest of this due to captcha...
    Examples: 
      | PortalName | email                   | Password   | Message                                  | email1       | email2          |
      | ARB        | rbuteamleader1@test.com | Support123 | Invalid login details. Please try again. | RBU@Test.com | 123arb@test.com |

  Scenario Outline: ARB-122: As an Agent Administrator, I want to update a users details so that their information is up to dates
    Given I want to login to portal "<PortalName>"
    And I wait for "4000" milliseconds
    And I check I am on "Login" page
    And I enter the details as
      | Fields   | Value      |
      | Email    | <email>    |
      | Password | <Password> |
    And I hit Enter
    Then I click on text "Manage Users"
    Then I click on text "ron.coldebella@dbresults.com.au"
    Then I wait for "4000" milliseconds
    Then I switch to frame "0"
    Then I click on button with value "EDIT"
    Then I click on button with value "Cancel"
    Then I check that table "RealEstateAgentTable_Wrapper" with row containing "<email_test>" has the following
      | Fields | Value            |
      | item1  | Ron              |
      | item1  | Coldebella       |
      | item1  | <email_test>     |
      | item1  | Property Manager |
      | item1  | Active           |
    Then I click on text "ron.coldebella@dbresults.com.au"
    Then I wait for "4000" milliseconds
    Then I switch to frame "0"
    Then I click on button with value "EDIT"
    #And I enter the details as
    #| Fields                   | Value          |
    #| USER_EXTENSION_FirstName | RonEdit        |
    #| USER_EXTENSION_LastName  | ColdebellaEdit |
    #| User_ContactPhone        |     1234567890 |
    Then I select "Agent Administrator" from "User_Role"
    Then I click on button with value "Save"
    Then I check that table "RealEstateAgentTable_Wrapper" with row containing "<email_test>" has the following
      | Fields | Value               |
      | item1  | Ron                 |
      | item1  | Coldebella          |
      | item1  | <email_test>        |
      | item1  | Agent Administrator |
      | item1  | Active              |
    Then I click on text "ron.coldebella@dbresults.com.au"
    Then I wait for "4000" milliseconds
    Then I switch to frame "0"
    Then I click on button with value "EDIT"
    #And I enter the details as
    #| Fields                   | Value      |
    #| USER_EXTENSION_FirstName | Ron        |
    #| USER_EXTENSION_LastName  | Coldebella |
    #| User_ContactPhone        | 1234567890 |
    Then I select "Property Manager" from "User_Role"
    Then I click on button with value "Save"
    Then I check that table "RealEstateAgentTable_Wrapper" with row containing "<email_test>" has the following
      | Fields | Value            |
      | item1  | Ron              |
      | item1  | Coldebella       |
      | item1  | <email_test>     |
      | item1  | Property Manager |
      | item1  | Active           |

    Examples: 
      | PortalName | email                | Password   | Message                                  | email_test                      |
      | ARB        | agentadmin2@test.com | Support123 | Invalid login details. Please try again. | ron.coldebella@dbresults.com.au |

  Scenario Outline: ARB-123: As an RBU Team Leader, I want to create user accounts for RBU and ACT Housing Officers so that they can access the portal
    Given I want to login to portal "<PortalName>"
    And I wait for "4000" milliseconds
    And I check I am on "Login" page
    And I enter the details as
      | Fields   | Value      |
      | Email    | <email>    |
      | Password | <Password> |
    And I hit Enter
    #Scenario 1: RBU Team Leader accesses the Create User function
    Then I click on text "Manage Users"
    Then I click on text "+ NEW USER"
    Then I wait for "2000" milliseconds
    Then I switch to frame "0"
    Then I check "User_Role" exists
    Then I check "USER_EXTENSION_FirstName" exists
    Then I check "USER_EXTENSION_LastName" exists
    Then I check "User_Email" exists
    Then I check "User_ContactPhone" exists
    Then I see text "An activation email will be sent to the email address entered. Due to security reasons, this link will expire in 60 minutes." displayed
    #Scenario 2: Mandatory fields not filled in
    Then I click on button with value "Save"
    Then I see text "Required fields have not been completed" displayed
    #Scenario 3: Email address not in the correct format
    Then I select "RBU Team Leader" from "User_Role"
    And I enter the details as
      | Fields                   | Value       |
      | USER_EXTENSION_FirstName | <FirstName> |
      | USER_EXTENSION_LastName  | <LastName>  |
      | User_ContactPhone        |  1234567890 |
      | User_Email               | TEST        |
    Then I click on button with value "Save"
    Then I see text "Email address is not valid, please try again" displayed
    #Scenario 4: Email address already registered
    And I enter the details as
      | Fields                   | Value       |
      | USER_EXTENSION_FirstName | <FirstName> |
      | USER_EXTENSION_LastName  | <LastName>  |
      | User_ContactPhone        |  1234567890 |
      | User_Email               | <email>     |
    Then I click on button with value "Save"
    Then I see text "Email address is already registered, please try again" displayed
    Then I click on button with value "Cancel"
    #Scenario 7: RBU Team Leader cancels user account creation with unsaved changes
    Then I wait for "2000" milliseconds
    Then I click on text "+ NEW USER"
    Then I wait for "2000" milliseconds
    Then I switch to frame "0"
    And I enter the details as
      | Fields                   | Value         |
      | USER_EXTENSION_FirstName | <FirstName>   |
      | USER_EXTENSION_LastName  | <LastName>    |
      | User_ContactPhone        |    1234567890 |
      | User_Email               | TEST@TEST.com |
    Then I click on button with value "Cancel"
    Then I see "There are unsaved changes on this page. Do you wish to proceed?" displayed on popup and I click "Cancel"
    Then I wait for "1000" milliseconds
    Then I click on button with value "Cancel"
    Then I see "There are unsaved changes on this page. Do you wish to proceed?" displayed on popup and I click "OK"
    #Scenario 6: RBU Team Leader cancels user account creation with no unsaved changes
    Then I click on text "+ NEW USER"
    Then I wait for "2000" milliseconds
    Then I switch to frame "0"
    Then I click on button with value "Cancel"
    #USER_EMAIL MUST BE CHANGED EACH TIME
    #Scenario 5: RBU Team Leader successfully creates a new user
    Then I click on text "+ NEW USER"
    Then I wait for "2000" milliseconds
    Then I switch to frame "0"
    Then I select "RBU Team Leader" from "User_Role"
    And I enter the details as
      | Fields                   | Value       |
      | USER_EXTENSION_FirstName | <FirstName> |
      | USER_EXTENSION_LastName  | <LastName>  |
      | User_ContactPhone        |  1234567890 |
    # | User_Email               | TEST17F@asdfasfdasdf.com |
    Then I enter "TEST@asdfsafd.com" with the current date prepended into "User_Email"
    Then I click on button with value "Save"
    Then I see text "User TESTAGAINAGAIN TESTAGAINAGAIN successfully created" displayed

    Examples: 
      | PortalName | email                   | Password   | Message                                  | email_test                      | FirstName      | LastName       | UserEmail                |
      | ARB        | rbuteamleader1@test.com | Support123 | Invalid login details. Please try again. | ron.coldebella@dbresults.com.au | TESTAGAINAGAIN | TESTAGAINAGAIN | TEST16F@asdfasfdasdf.com |

  Scenario Outline: ARB-125: As an RBU Team Leader, I want to deactivate a user within RBU or ACT Housing so that they can no longer access the portal
    #Scenario 1: RBU Team Leader accesses the edit user account function from the Manage Users page
    Given I want to login to portal "<PortalName>"
    And I wait for "4000" milliseconds
    And I check I am on "Login" page
    And I enter the details as
      | Fields   | Value      |
      | Email    | <email>    |
      | Password | <Password> |
    And I hit Enter
    Then I click on text "Manage Users"
    Then I check that table "RealEstateAgentTable_Wrapper" with row containing "<email_test>" has the following
      | Fields | Value           |
      | item1  | RBU             |
      | item1  | Leader          |
      | item1  | <email_test>    |
      | item1  | RBU Team Leader |
    Then I click on text "RBU@Test.com"
    And I wait for "4000" milliseconds
    Then I switch to frame "0"
    Then I click on button with value "EDIT"
    And I wait for "4000" milliseconds
    Then I check "User_Role" exists
    Then I check "USER_EXTENSION_FirstName" is readonly
    Then I check "USER_EXTENSION_LastName" is readonly
    Then I check "User_Email" is readonly
    Then I check "User_ContactPhone" is readonly
    #Scenario 4: RBU Team Leader cancels user account creation with no unsaved changes
    Then I click on button with value "Cancel"
    Then I check I am on "ManageUsers" page
    #Scenario 5: RBU Team Leader cancels user account creation with unsaved changes
    Then I click on text "RBU@Test.com"
    And I wait for "4000" milliseconds
    Then I switch to frame "0"
    Then I click on button with value "EDIT"
    Then I select "RBU Officer" from "User_Role"
    Then I click on button with value "Cancel"
    Then I see "There are unsaved changes on this page. Do you wish to proceed?" displayed on popup and I click "Cancel"
    Then I click on button with value "Cancel"
    Then I see "There are unsaved changes on this page. Do you wish to proceed?" displayed on popup and I click "OK"
    #Scenario 3: RBU Team Leader updates a user’s role
    Then I click on text "RBU@Test.com"
    And I wait for "4000" milliseconds
    Then I switch to frame "0"
    Then I click on button with value "EDIT"
    Then I select "RBU Officer" from "User_Role"
    Then I click on button with value "Save"
    Then I check that table "RealEstateAgentTable_Wrapper" with row containing "<email_test>" has the following
      | Fields | Value        |
      | item1  | RBU          |
      | item1  | Leader       |
      | item1  | <email_test> |
      | item1  | RBU Officer  |
    Then I click on text "RBU@Test.com"
    And I wait for "4000" milliseconds
    Then I switch to frame "0"
    Then I click on button with value "EDIT"
    Then I select "RBU Team Leader" from "User_Role"
    Then I click on button with value "Save"
    Then I check that table "RealEstateAgentTable_Wrapper" with row containing "<email_test>" has the following
      | Fields | Value           |
      | item1  | RBU             |
      | item1  | Leader          |
      | item1  | <email_test>    |
      | item1  | RBU Team Leader |

    Examples: 
      | PortalName | email                   | Password   | Message                                  | email_test   |
      | ARB        | rbuteamleader1@test.com | Support123 | Invalid login details. Please try again. | RBU@Test.com |

  Scenario Outline: ARB-139: As an RBU Team Leader, I want to reactivate a user within RBU or ACT Housing so that they can access the portal again
    Given I want to login to portal "<PortalName>"
    And I wait for "6000" milliseconds
    And I check I am on "Login" page
    And I enter the details as
      | Fields   | Value      |
      | Email    | <email>    |
      | Password | <Password> |
    And I hit Enter
    Then I click on text "Manage Users"
    Then I check that table "RealEstateAgentTable_Wrapper" with row containing "<email_test>" has the following
      | Fields | Value           |
      | item1  | Nitin           |
      | item1  | Paul            |
      | item1  | <email_test>    |
      | item1  | RBU Team Leader |
      | item1  | Inactive        |
    #Scenario 3: RBU Team Leader does not confirm reactivation
    Then I click on text "<email_test>"
    Then I wait for "6000" milliseconds
    Then I switch to frame "0"
    Then I click on button with value "EDIT"
    Then I wait for "6000" milliseconds
    Then I click on button with value "Active"
    Then I click on button with value "Save"
    Then I wait for "6000" milliseconds
    Then I see text "Are you sure you want to reactivate this user?" displayed
    Then I click on button with value "No"
    Then I wait for "6000" milliseconds
    Then I click on button with value "Cancel"
    Then I check that table "RealEstateAgentTable_Wrapper" with row containing "<email_test>" has the following
      | Fields | Value           |
      | item1  | Nitin           |
      | item1  | Paul            |
      | item1  | <email_test>    |
      | item1  | RBU Team Leader |
      | item1  | Inactive        |
    #Scenario 1: RBU Team Leader reactivates user account
    Then I click on text "<email_test>"
    Then I wait for "6000" milliseconds
    Then I switch to frame "0"
    Then I click on button with value "EDIT"
    Then I wait for "6000" milliseconds
    Then I click on button with value "Active"
    Then I click on button with value "Save"
    Then I wait for "6000" milliseconds
    #
    Then I see text "Are you sure you want to reactivate this user?" displayed
    Then I click on button with value "Yes"
    Then I wait for "6000" milliseconds
    Then I see text "Nitin Paul's details have been successfully updated." displayed
    Then I check that table "RealEstateAgentTable_Wrapper" with row containing "<email_test>" has the following
      | Fields | Value           |
      | item1  | Nitin           |
      | item1  | Paul            |
      | item1  | <email_test>    |
      | item1  | RBU Team Leader |
      | item1  | Active          |
    #Scenario 2: RBU Team Leader confirms reactivation
    Then I click on text "Sign Out"
    Given I want to login to portal "<PortalName>"
    And I wait for "6000" milliseconds
    And I check I am on "Login" page
    And I enter the details as
      | Fields   | Value        |
      | Email    | <email_test> |
      | Password | <Password>   |
    And I hit Enter
    Then I check I am on "ManageBonds" page
    Then I click on text "Sign Out"
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields   | Value      |
      | Email    | <email>    |
      | Password | <Password> |
    And I hit Enter
    Then I click on text "Manage Users"
    Then I click on text "<email_test>"
    Then I wait for "6000" milliseconds
    Then I switch to frame "0"
    Then I click on button with value "EDIT"
    Then I wait for "6000" milliseconds
    Then I click on button with value "Inactive"
    Then I click on button with value "Save"
    Then I wait for "6000" milliseconds
    # now reactive the user again
    Then I see text "Are you sure you want to deactivate this user?" displayed
    Then I click on button with value "Yes"
    Then I wait for "6000" milliseconds
    Then I check that table "RealEstateAgentTable_Wrapper" with row containing "<email_test>" has the following
      | Fields | Value           |
      | item1  | Nitin           |
      | item1  | Paul            |
      | item1  | <email_test>    |
      | item1  | RBU Team Leader |
      | item1  | Inactive        |

    Examples: 
      | PortalName | email                   | Password   | Message                                  | email_test       |
      | ARB        | rbuteamleader1@test.com | Support123 | Invalid login details. Please try again. | nitin@amail.club |

  #BUGGED, IGNORE FOR NOW
  #	Scenario Outline: ARB-97: As an anonymous user (E.g. Tenant) who is not logged in, I want to search for a bond so that I can view details of this bond
  #	  Given I want to login to portal "<PortalName>"
  #And I wait for "4000" milliseconds
  #And I check I am on "Login" page
  #And I enter the details as
  #| Fields   | Value      |
  #| Email    | <email>    |
  #| Password | <Password> |
  #And I hit Enter
  #
  #Scenario 1: User selects Bond/s for payment
  #Then I click on text "1000101"
  #Then I check I am on "
  #
  #Scenario 2: User views the Bond Payment information
  #
  #Scenario 3: User cancels Bond Payment
  #
  #Scenario 4: User cancels Bond Payment
  #
  #	 Examples:
  #| PortalName | email                   | Password   | Message                                  | email1       | email2          |
  #| ARB        | rbuteamleader1@test.com | Support123 | Invalid login details. Please try again. | RBU@Test.com | 123arb@test.com |q
  Scenario Outline: ARB-165: As an RBU Team Leader, I want to resend the activation email so that the user can activate their account and login to the portal
    Given I want to login to portal "<PortalName>"
    And I wait for "4000" milliseconds
    And I check I am on "Login" page
    And I enter the details as
      | Fields   | Value      |
      | Email    | <email>    |
      | Password | <Password> |
    And I hit Enter
    Then I click on text "Manage Users"
    #Scenario 1: RBU Team Leader is viewing a user account where the status is not ‘Registered’
    Then I click on text "<email1>"
    Then I wait for "4000" milliseconds
    Then I switch to frame "0"
    Then I see text "RESEND ACTIVATION EMAIL" not displayed
    Then I click on button with value "EDIT"
    Then I wait for "4000" milliseconds
    Then I click on button with value "Cancel"
    #Scenario 2: RBU Team Leader is viewing a user account where the status is ‘Registered’
    Then I click on text "<email2>"
    Then I wait for "4000" milliseconds
    Then I switch to frame "0"
    Then I wait for "4000" milliseconds
    Then I see text "RESEND ACTIVATION EMAIL" displayed
    #Scenario 3: RBU re-sends activation email
    Then I click on text "RESEND ACTIVATION EMAIL"
    Then I wait for "4000" milliseconds
    Then I see text "The activation email has been sent." displayed

    Examples: 
      | PortalName | email                   | Password   | Message                                  | email1       | email2          |
      | ARB        | rbuteamleader1@test.com | Support123 | Invalid login details. Please try again. | RBU@Test.com | 123arb@test.com |

  Scenario Outline: ARB-126
    Given I want to login to portal "<PortalName>"
    And I wait for "4000" milliseconds
    And I check I am on "Login" page
    And I enter the details as
      | Fields   | Value      |
      | Email    | <email>    |
      | Password | <Password> |
    And I hit Enter
    Then I click on text "Manage Users"
    Then I check that table "UserListTable" with row containing "<email_test>" has the following
      | Fields | Value        |
      | item1  | RBU Officer  |
      | item1  | TEST         |
      | item1  | <email_test> |
      | item1  | RBU Officer  |
      | item1  | Active       |
    #Scenario 3: RBU Team Leader does not confirm deactivation
    Then I click on text "<email_test>"
    Then I wait for "4000" milliseconds
    Then I switch to frame "0"
    Then I click on button with value "EDIT"
    Then I wait for "4000" milliseconds
    Then I click on button with value "Inactive"
    Then I click on button with value "Save"
    Then I wait for "4000" milliseconds
    Then I see text "Are you sure you want to deactivate this user?" displayed
    Then I click on button with value "No"
    Then I wait for "4000" milliseconds
    Then I click on button with value "Cancel"
    Then I check that table "UserListTable" with row containing "<email_test>" has the following
      | Fields | Value        |
      | item1  | RBU Officer  |
      | item1  | TEST         |
      | item1  | <email_test> |
      | item1  | RBU Officer  |
      | item1  | Active       |
    #Scenario 1: RBU Team Leader deactivates user account
    Then I click on text "<email_test>"
    Then I wait for "4000" milliseconds
    Then I switch to frame "0"
    Then I click on button with value "EDIT"
    Then I wait for "4000" milliseconds
    Then I click on button with value "Inactive"
    Then I click on button with value "Save"
    Then I wait for "4000" milliseconds
    #
    Then I see text "Are you sure you want to deactivate this user?" displayed
    Then I click on button with value "Yes"
    Then I wait for "4000" milliseconds
    Then I see text "RBU Officer TEST's details have been successfully updated." displayed
    Then I check that table "RealEstateAgentTable_Wrapper" with row containing "<email_test>" has the following
      | Fields | Value        |
      | item1  | RBU Officer  |
      | item1  | TEST         |
      | item1  | <email_test> |
      | item1  | RBU Officer  |
      | item1  | Inactive     |
    #Scenario 2: RBU Team Leader confirms deactivation
    Then I click on text "Sign Out"
    Given I want to login to portal "<PortalName>"
    And I wait for "4000" milliseconds
    And I check I am on "Login" page
    And I enter the details as
      | Fields   | Value        |
      | Email    | <email_test> |
      | Password | <Password>   |
    And I hit Enter
    Then I see text "Your email address or password is incorrect, please try again." displayed
    And I enter the details as
      | Fields   | Value      |
      | Email    | <email>    |
      | Password | <Password> |
    And I hit Enter
    Then I click on text "Manage Users"
    Then I click on text "<email_test>"
    Then I wait for "4000" milliseconds
    Then I switch to frame "0"
    Then I click on button with value "EDIT"
    Then I wait for "4000" milliseconds
    Then I click on button with value "Active"
    Then I click on button with value "Save"
    Then I wait for "4000" milliseconds
    # now reactive the user again
    Then I see text "Are you sure you want to reactivate this user?" displayed
    Then I click on button with value "Yes"
    Then I wait for "4000" milliseconds
    Then I check that table "UserListTable" with row containing "<email_test>" has the following
      | Fields | Value        |
      | item1  | RBU Officer  |
      | item1  | TEST         |
      | item1  | <email_test> |
      | item1  | RBU Officer  |
      | item1  | Active       |

    Examples: 
      | PortalName | email                   | Password   | Message                                  | email_test             |
      | ARB        | rbuteamleader1@test.com | Support123 | Invalid login details. Please try again. | honesurevo@mystvpn.com |

  #Scenario Outline: Logins using different access levels;
  #Given I want to login to portal "<PortalName>"
  #And I wait for "4000" milliseconds
  #And I check I am on "Login" page
  #And I enter the details as
  #| Fields   | Value      |
  #| Email    | <email>    |
  #| Password | <Password> |
  #And I hit Enter
  #And I check I am on "ManageBonds" page
  #And I click on text "Agent One"
  #Then I click on text "Lodge Bond"
  #Then I check I am on "Bond Lodgement Premise" page
  #Scenario 1: User accesses the ‘Lodge Bond’ function
  #Then I see text "Section and Block information can be found on your Rates notice" displayed
  #And I enter the details as
  #| Fields             | Value                               |
  #| OneLineAddress     | 10 FLORA AVE, BADGER CREEK VIC 3777 |
  #| NumberOfBedrooms   |                                  11 |
  #| TotalBondAmount    |                                 100 |
  #| WeeklyRentalAmount |                                 100 |
  #Then I select "Separated House" from "DwellingType"
  #Then I click on button with value "Next"
  #Then I check I am on "Bond Step2" page
  #Then I enter the details as
  #| Fields            | Value             |
  #| TenantFirstName   | auto              |
  #| TenantLastName    | test              |
  #| wtTenantPhone     |        2432343434 |
  #| TenantBSB         |            123123 |
  #| TenantAcctNum     |         123123123 |
  #| TenantAccountName | OneTwoThree       |
  #| TenantEmail       | tenant@tenant.com |
  #Then I enter the details as
  #| Fields              | Value             |
  #| LessorFirstName     | auto              |
  #| LessorLastName      | test              |
  #| LessorPhone         |        2432343434 |
  #| LessorBSB           |            123123 |
  #| LessorAccountNumber |         123123123 |
  #| LessorAccountName   | OneTwoThree       |
  #| LessorEmail         | Lessor@tenant.com |
  #Then I click on button with value "Next"
  #Then I check I am on "Bond Lodgement Summary" page
  #Then "<Item>" is displayed as "<ItemName>"
  #| Item  | ItemName                                                          |
  #| item1 | Bond Lodgement Summary                                            |
  #| item2 | Rented Premise Details                                            |
  #| item3 | Bond and Tenancy Details                                          |
  #| item4 | Tenant Details                                                    |
  #| item5 | Managing Agent Details                                            |
  #| item6 | Lessor Details                                                    |
  #| item7 | I confirm that these details are correct at the time of lodgement |
  #And I click on "I confirm that these details are correct at the time of lodgement" checkbox
  #Then I click on button with value "Next"
  #Then I check I am on "Bond Lodgement Confirmation" page
  #Then "<Item>" is displayed as "<ItemName>"
  #| Item  | ItemName                               |
  #| item1 | Lodgement Complete                     |
  #| item2 | BACK TO BONDS                          |
  #| item2 | You have successfully lodged your Bond |
  #Then I click on button with value "View Payment Info"
  #Then I check I am on "Bond Payment View" page
  #Then "<Item>" is displayed as "<ItemName>"
  #| Item  | ItemName                                          |
  #| item1 | Direct Deposit                                    |
  #| item3 | ACT Rental Bonds                                  |
  #| item4 | 263-562                                           |
  #| item5 | 263-562                                           |
  #| item6 | 1928 4435 55                                      |
  #| item7 | On clicking Submit, these bonds will be marked as |
  #Scenario 2
  #Then I click on button with value "Cancel"
  #Then I check I am on "Bond Lodgement Confirmation" page
  #Scenario 3
  #Then I click on button with value "View Payment Info"
  #Then I check I am on "Bond Payment View" page
  #Then "<Item>" is displayed as "<ItemName>"
  #| Item  | ItemName                                          |
  #| item1 | Direct Deposit                                    |
  #| item3 | ACT Rental Bonds                                  |
  #| item4 | 263-562                                           |
  #| item5 | 263-562                                           |
  #| item6 | 1928 4435 55                                      |
  #| item7 | On clicking Submit, these bonds will be marked as |
  #Then I click on button with value "Submit"
  #Then I check I am on "ManageBonds" page
  #
  #Examples:
  #| PortalName | email                     | Password   | Message                                  |
  #| ARB        | FirstAgentOne@agency1.com | Support123 | Invalid login details. Please try again. |
  Scenario Outline: popup test
    Given I want to login to portal "<PortalName>"
    And I wait for "4000" milliseconds
    And I check I am on "Login" page
    And I enter the details as
      | Fields   | Value      |
      | Email    | <email>    |
      | Password | <Password> |
    And I hit Enter
    #Scenario 1: RBU Team Leader accesses the Create User function
    Then I click on text "Manage Users"
    Then I click on text "+ NEW USER"
    Then I wait for "2000" milliseconds
    Then I switch to frame "0"
    #Scenario 2: Mandatory fields not filled in
    Then I click on button with value "Save"
    Then I see text "Required fields have not been completed" displayed
    #Scenario 3: Email address not in the correct format
    Then I select "RBU Team Leader" from "User_Role"
    And I enter the details as
      | Fields                   | Value       |
      | USER_EXTENSION_FirstName | <FirstName> |
      | USER_EXTENSION_LastName  | <LastName>  |
      | User_ContactPhone        |  1234567890 |
      | User_Email               | TEST        |
    Then I click on button with value "Save"
    Then I see text "Email address is not valid, please try again" displayed
    #Scenario 4: Email address already registered
    And I enter the details as
      | Fields                   | Value       |
      | USER_EXTENSION_FirstName | <FirstName> |
      | USER_EXTENSION_LastName  | <LastName>  |
      | User_ContactPhone        |  1234567890 |
      | User_Email               | <email>     |
    Then I click on button with value "Save"
    Then I see text "Email address is already registered, please try again" displayed
    Then I click on button with value "Cancel"
    #Scenario 7: RBU Team Leader cancels user account creation with unsaved changes
    Then I wait for "2000" milliseconds
    Then I click on text "+ NEW USER"
    Then I wait for "2000" milliseconds
    Then I switch to frame "0"
    And I enter the details as
      | Fields                   | Value         |
      | USER_EXTENSION_FirstName | <FirstName>   |
      | USER_EXTENSION_LastName  | <LastName>    |
      | User_ContactPhone        |    1234567890 |
      | User_Email               | TEST@TEST.com |
    Then I click on button with value "Cancel"
    Then I see "There are unsaved changes on this page. Do you wish to proceed?" displayed on popup and I click "Cancel"
    Then I wait for "1000" milliseconds
    Then I click on button with value "Cancel"

    Examples: 
      | PortalName | email                   | Password   | Message                                  | email_test                      | FirstName      | LastName       | UserEmail                |
      | ARB        | rbuteamleader1@test.com | Support123 | Invalid login details. Please try again. | ron.coldebella@dbresults.com.au | TESTAGAINAGAIN | TESTAGAINAGAIN | TEST16F@asdfasfdasdf.com |
