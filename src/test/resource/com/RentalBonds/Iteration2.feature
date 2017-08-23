
Feature: Iteration 2 tests

	#DONE: 91, 122, 123, 125, 126, 139, 165, 
  #CANNOT DO: 121,
  

  #DONE: ARB-333

 
	Scenario Outline: ARB-91: As an anonymous user E.g. Tenant who is not logged in, I want to search for a bond so that I can view details of this bond
    Given I want to login to portal "<PortalName>"
    #Scenario 1: User accesses the anonymous Search Bond function
    Then I see text "Please type the bond number and the last (family) name of any tenant listed on the bond." displayed
    Then I check "BondNumber2" exists
    Then I check "LastName3" exists
    Then I check "SearchButton" exists

    #Can't do the rest of this due to captcha...
    Examples: 
      | PortalName | email                   | Password   | Message                                  | email1       | email2          |
      | BondSearch        | rbuteamleader1@test.com | Support123 | Invalid login details. Please try again. | RBU@Test.com | 123arb@test.com |
      
 
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
      | Fields                   | Value      |
      | USER_EXTENSION_FirstName | <FirstName>        |
      | USER_EXTENSION_LastName  | <LastName>       |
      | User_ContactPhone        | 1234567890 |
      | User_Email               | TEST       |
    Then I click on button with value "Save"
    Then I see text "Email address is not valid, please try again" displayed
    #Scenario 4: Email address already registered
    And I enter the details as
      | Fields                   | Value      |
      | USER_EXTENSION_FirstName | <FirstName>        |
      | USER_EXTENSION_LastName  | <LastName>       |
      | User_ContactPhone        | 1234567890 |
      | User_Email               | <email>    |
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
      | USER_EXTENSION_FirstName | <FirstName>     |
      | USER_EXTENSION_LastName  | <LastName>     |
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
      | Fields                   | Value                         |
      | USER_EXTENSION_FirstName | <FirstName>                |
      | USER_EXTENSION_LastName  | <LastName>                |
      | User_ContactPhone        |                    1234567890 |
     # | User_Email               | TEST17F@asdfasfdasdf.com |
    Then I enter "TEST@asdfsafd.com" with the current date prepended into "User_Email"
    Then I click on button with value "Save"
    Then I see text "User TESTAGAINAGAIN TESTAGAINAGAIN successfully created" displayed

    Examples: 
      | PortalName | email                   | Password   | Message                                  | email_test                      | FirstName | LastName | UserEmail | 
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
      | Fields | Value        |
      | item1  | RBU  |
      | item1  | Leader        |
      | item1  | <email_test> |
      | item1  | RBU Team Leader   |
	
    
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
      | item1  | RBU  |
      | item1  | Leader        |
      | item1  | <email_test> |
      | item1  | RBU Officer   |
	
		Then I click on text "RBU@Test.com"
		And I wait for "4000" milliseconds
			
	  Then I switch to frame "0"
	  Then I click on button with value "EDIT"
		Then I select "RBU Team Leader" from "User_Role"
		Then I click on button with value "Save"
		Then I check that table "RealEstateAgentTable_Wrapper" with row containing "<email_test>" has the following
      | Fields | Value        |
      | item1  | RBU  |
      | item1  | Leader        |
      | item1  | <email_test> |
      | item1  | RBU Team Leader   |
	
	
 	Examples: 
      | PortalName | email                   | Password   | Message                                  | email_test                      |
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
      | Fields | Value        |
      | item1  | Nitin  |
      | item1  | Paul        |
      | item1  | <email_test> |
      | item1  | RBU Team Leader   |
      | item1  | Inactive       |
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
       | Fields | Value        |
      | item1  | Nitin  |
      | item1  | Paul        |
      | item1  | <email_test> |
      | item1  | RBU Team Leader   |
      | item1  | Inactive       |
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
     | Fields | Value        |
      | item1  | Nitin  |
      | item1  | Paul        |
      | item1  | <email_test> |
      | item1  | RBU Team Leader   |
      | item1  | Active       |
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
      | Fields | Value        |
      | item1  | Nitin  |
      | item1  | Paul        |
      | item1  | <email_test> |
      | item1  | RBU Team Leader   |
      | item1  | Inactive       |

    Examples: 
      | PortalName | email                   | Password   | Message                                  | email_test             |
      | ARB        | rbuteamleader1@test.com | Support123 | Invalid login details. Please try again. | nitin@amail.club |


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
      | item1  | RBU Officer   |
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
      | item1  | RBU Officer   |
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
      | item1  | RBU Officer   |
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
      | item1  | RBU Officer   |
      | item1  | Active       |

    Examples: 
      | PortalName | email                   | Password   | Message                                  | email_test             |
      | ARB        | rbuteamleader1@test.com | Support123 | Invalid login details. Please try again. | honesurevo@mystvpn.com |
