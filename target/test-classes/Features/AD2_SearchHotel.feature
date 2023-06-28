@SearchHotel
Feature: Verifying Adactin Hotels Login details & navigate to select hotels

  Scenario Outline: Verifying Adactin Hotel login and enter all fields and navigate to select hotel
    Given User on the Adactin page
    When User should perform login "<username>" and "<password>"
    Then User should verify after login success message "Hello nitish123!"
    And User should enter all fields in search hotel "<location>","<hotels>","<roomType>","<noOfRooms>","<dateCheckIn>","<dateCheckOut>","<adultsPerRoom>" and "<childPerRoom>"
    Then User should verify after search hotel success message "Select Hotel"

    Examples: 
      | username  | password | location  | hotels         | roomType | noOfRooms | dateCheckIn | dateCheckOut | adultsPerRoom | childPerRoom |
      | nitish123 | V54198   | Melbourne | Hotel Sunshine | Deluxe   | 2 - Two   | 18/12/2022  | 19/12/2022   | 2 - Two       | 2 - Two      |

  Scenario Outline: Verifying Adactin Hotel login and enter only mandatory fields and navigate to select hotel
    Given User on the Adactin page
    When User should perform login "<username>" and "<password>"
    Then User should verify after login success message "Hello nitish123!"
    And User should enter only mandatory fields "<location>","<noOfRooms>","<dateCheckIn>","<dateCheckOut>" and "<adultsPerRoom>"
    Then User should verify after search hotel success message "Select Hotel"

    Examples: 
      | username  | password | location  | noOfRooms | dateCheckIn | dateCheckOut | adultsPerRoom |
      | nitish123 | V54198   | Melbourne | 1 - One   | 18/12/2022  | 19/12/2022   | 2 - Two       |

  Scenario Outline: Verifying Adactin Hotel login and enter invalid Date
    Given User on the Adactin page
    When User should perform login "<username>" and "<password>"
    Then User should verify after login success message "Hello nitish123!"
    And User should search hotel "<location>","<hotels>","<roomType>","<noOfRooms>","<dateCheckIn>","<dateCheckOut>","<adultsPerRoom>" and "<childPerRoom>"
    Then User should verify after search hotel with invalid date error message contains "Check-In Date shall be before than Check-Out Date" and "Check-Out Date shall be after than Check-In Date"

    Examples: 
      | username  | password | location  | hotels         | roomType | noOfRooms | dateCheckIn | dateCheckOut | adultsPerRoom | childPerRoom |
      | nitish123 | V54198   | Melbourne | Hotel Sunshine | Deluxe   | 1 - One   | 20/12/2022  | 19/12/2022   | 2 - Two       | 2 - Two      |

  Scenario Outline: Verifying Adactin Hotel login and without enter any fields in search hotel and perform search
    Given User on the Adactin page
    When User should perform login "<username>" and "<password>"
    Then User should verify after login success message "Hello nitish123!"
    And User should search without enter any fields in search hotel page
    Then User should verify after search hotel with error message "Please Select a Location"

    Examples: 
      | username  | password |
      | nitish123 | V54198   |
