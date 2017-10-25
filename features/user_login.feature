Feature: User Login
    As a User
    So that I can manage my account
    And interact with OpenHouse
    I want to be able to log in
    
Background: a user has been created in the database
    Given I am on the user creation page
    And I create the OpenHouse user
    Then a user with the following fields should exist:
      | email          | password | billing_street_address | billing_city | billing_state | billing_zip_code | first_name | last_name | credit_card_number   | expiration_date | cvv |
      | dave@gmail.com | 12345678 | 2700 Mars              | Berkeley     | California    | 94720            | Dave       | Schiller  | 12341234123412341234 | 6/22            | 511 |

Scenario: Host can log in with correct credentials
    Given I am not logged in
    And I am on the OpenHouse home page
    And I enter my credentials
    When I press the "Log In" button
    Then I should be logged in

Scenario: Host cannot log in with incorrect credentials
    Given I am not logged in
    And I am on the OpenHouse home page
    And I enter invalid credentials
    When I press the "Log In" button
    Then I should see an error message

Scenario: Host cannot log in if already logged in
    Given I am logged in
    And I am on the OpenHouse home page
    Then I should not see the option to log in
