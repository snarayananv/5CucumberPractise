@SelectHotel
Feature: Verifying Adactin Select hotel & navigates to Book hotel

  Scenario Outline: Verifying Adactin Select Hotel & Continue to book hotel
    Given User on the Adactin page
    When User should perform login "<username>" and "<password>"
    Then User should verify after login success message "Hello nitish123!"
    And User should enter all fields in search hotel "<location>","<hotels>","<roomType>","<noOfRooms>","<dateCheckIn>","<dateCheckOut>","<adultsPerRoom>" and "<childPerRoom>"
    Then User should verify after search hotel success message "Select Hotel"
    And User should click Continue select hotel
    Then User should verify select hotel success message "Book A Hotel"

    Examples: 
      | username  | password | location  | hotels         | roomType | noOfRooms | dateCheckIn | dateCheckOut | adultsPerRoom | childPerRoom |
      | nitish123 | V54198   | Melbourne | Hotel Sunshine | Deluxe   | 1 - One   | 19/12/2022  | 20/12/2022   | 2 - Two       | 2 - Two      |

  Scenario Outline: Verifying Adactin Select Hotel page without selecting hotel
    Given User on the Adactin page
    When User should perform login "<username>" and "<password>"
    Then User should verify after login success message "Hello nitish123!"
    And User should enter all fields in search hotel "<location>","<hotels>","<roomType>","<noOfRooms>","<dateCheckIn>","<dateCheckOut>","<adultsPerRoom>" and "<childPerRoom>"
    Then User should verify after search hotel success message "Select Hotel"
    And User should Click Continue without Select Hotel
    Then User should verify after Select Hotel with error message "Please Select a Hotel"

    Examples: 
      | username  | password | location  | hotels         | roomType | noOfRooms | dateCheckIn | dateCheckOut | adultsPerRoom | childPerRoom |
      | nitish123 | V54198   | Melbourne | Hotel Sunshine | Deluxe   | 1 - One   | 20/12/2022  | 21/12/2022   | 2 - Two       | 2 - Two      |
