Feature: Account Creation
    As a human
    So that I can start using OpenHouse
    I want to create an OpenHouse account

Background: movies have been added to database
  Given the following accounts exist:
    | email                   | password | billing_street_address | billing_city | billing_state  | billing_zip_code | first_name | last_name | credit_card_number | expiration_date | cvv |
    | aladdin@agrabah.com     | 12341001 | Agrabah Dessert        | Agrabah      | Middle East    | 10101            | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 |
    | terminator@future.com   | password | 1234 Robots Factory    | New Berkeley | New California | 76767            | Terminator | T-800     | 2222222222222222   | 26-Oct-2017     | 222 |

Scenario: Human can create an account with an unused username
    Given I am on the home page
    When I follow "Log In"
    When I follow "Sign up now!"
    And I fill in "E-mail Address" with "dave101@gmail.com"
    And I fill in "Password" with "12345678"
    Then I press "Submit"
    Then I should see "dave101@gmail.com was successfully created."
    And account with email "dave101@gmail.com" should exist

Scenario: Human cannot create an account with a used username
    Given I am on the home page
    When I follow "Log In"
    When I follow "Sign up now!"
    And I fill in "E-mail Address" with "aladdin@agrabah.com"
    And I fill in "Password" with "12345678"
    Then I press "Submit"
    Then I should see "An account with that e-mail address already exists."
    And account with email "aladdin@agrabah.com" should exist
