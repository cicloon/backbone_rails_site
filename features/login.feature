Feature: An user attemp to login to the app

  Scenario: User logins without existing email
    Given an existing user without email
    When I log in
    Then I should be redirected to the "new users email" page

  Scenario: User logins with email
    Given an existing user with email
    When I log in
    Then I should be redirected to the "root" page

  Scenario: User try to login with invalid params
    Given I try to log in with username "prueba" and password "prueba"
    When I press "Entrar"
    Then I should see an error message with "Usuario o contraseña inválidos."