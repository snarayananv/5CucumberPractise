@CancelBooking
Feature: Verifying Adactin Booking cancellation

  Scenario Outline: Verifying Adactin Cancel booking
    Given User on the Adactin page
    When User should perform login "<username>" and "<password>"
    Then User should verify after login success message "Hello nitish123!"
    And User should enter all fields in search hotel "<location>","<hotels>","<roomType>","<noOfRooms>","<dateCheckIn>","<dateCheckOut>","<adultsPerRoom>" and "<childPerRoom>"
    Then User should verify after search hotel success message "Select Hotel"
    And User should click Continue select hotel
    Then User should verify select hotel success message "Book A Hotel"
    And User should enter "<firstName>","<lastName>" and "<billingAddress>"
      | ccNumber         | ccType           | expMonth | expYear | cVV |
      | 8765432187654321 | Master Card      | April    |    2017 | 344 |
      | 1234567890123456 | VISA             | December |    2022 | 367 |
      | 8723743187654321 | American Express | March    |    2020 | 398 |
    Then User should verify Booking success message "Booking Confirmation" and save the generated order id
    And User should cancel generated order Id
    Then User should verify after cancelling order Id success message "The booking has been cancelled."

    Examples: 
      | username  | password | location  | hotels         | roomType | noOfRooms | dateCheckIn | dateCheckOut | adultsPerRoom | childPerRoom | firstName | lastName | billingAddress |
      | nitish123 | V54198   | Melbourne | Hotel Sunshine | Deluxe   | 1 - One   | 20/12/2022  | 21/12/2022   | 2 - Two       | 2 - Two      | Suriya    | Suriya   | 3,Chennai      |

  Scenario Outline: Verifying Adactin Cancel the existing order Id
    Given User on the Adactin page
    When User should perform login "<username>" and "<password>"
    Then User should verify after login success message "Hello nitish123!"
    And User should cancel the existing order Id "<orderId>"
    Then User should verify after cancelling order Id success message "The booking has been cancelled."

    Examples: 
      | username  | password | orderId    |
      | nitish123 | V54198   | D6815T912X |
