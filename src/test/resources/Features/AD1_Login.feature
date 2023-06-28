@Login
Feature: Verfying Adactin Hotel Login details

  Scenario Outline: verifying Adactin Hotel login with valid credentials
    Given User on the Adactin page
    When User should perform login "<username>" and "<password>"
    Then User should verify after login success message "Hello nitish123!"

    Examples: 
      | username  | password |
      | nitish123 | V54198   |

  Scenario Outline: verifying Adactin Hotel login using Enter
    Given User on the Adactin page
    When User should perform login "<username>" and "<password>" with Enter key
    Then User should verify after login success message "Hello nitish123!"

    Examples: 
      | username  | password |
      | nitish123 | V54198   |

  Scenario Outline: verifying Adactin Hotel login with invalid credentials
    Given User on the Adactin page
    When User should perform login "<username>" and "<password>"
    Then User should verify after login with invalid credential error message contains "Invalid Login details or Your Password might have expired."

    Examples: 
      | username  | password |
      | nitish123 | jdfggs   |
