Feature: As an user I want to confirm my invitation to the wedding

  Scenario: An user who just arrived to the home page will be prompted to confirm his assistance.    
    Given an existing user with email 
        And I have 2 invitees
    When I log in
    Then I should see "¡Aún no habéis confirmado!"
        And I should see "¡¡Haz click aquí y podréis confirmar vuestra asistencia a la boda del año!!"

  @javascript
  Scenario: An user who wants to confirm his assistance.
    Given an existing user with email 
    And I have 1 invitees
    And I am logged
    When I follow "Confirmar" 
        And I follow "confirm"
    Then I should see "Genial, ¡viene a la boda!"
    When I follow "Volver"
    Then show me the page
    Then I should not see "¡Aún no habéis confirmado!"
    
  @javascript
  Scenario: An user who wants to confirm his NOT assistance.
    Given an existing user with email 
    And I have 2 invitees
    And I am logged
    When I follow "Confirmar"
        And I follow "decline"
    Then I should see "Oh, ¿seguro que no se arrepentirá?"    