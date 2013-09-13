Feature: An user want to config his account

  Scenario: An user who just arrived to the app will be prompted to enter his email and he enters a valid email
    Given I am logged in for the first time
    When I am prompted for my email
    And I fill in my email with "prueba@mailinator.com"
    And I press "Enviar"
    Then I should see a notice message with "Hemos guardado tu email"
    And I should be in the "root" page

  Scenario: An user who just arrived to the app will be prompted to enter his email and he enters an invalid email
    Given I am logged in for the first time
    When I am prompted for my email
    And I fill in my email with "pruebamailinator.com"
    And I press "Enviar"
    Then I should see an error message with "Email no válido"
