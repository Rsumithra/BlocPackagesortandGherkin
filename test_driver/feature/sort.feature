Feature:Sorting
The listview has to change when we do sort

Scenario: Test tab one alphabeticASC sorting feature of the app
        Given I test the initial state of the app
        And I click the "group1" icon
        Then I see if the text "name 1" exists
        And I click the "filterIcon" icon
        And I click the "alphabeticASC" icon
        And I click the "Done" icon
        Then I see if the text "name 1" exists

    Scenario: Test tab one alphabeticDSC sorting feature of the app
        Given I test the initial state of the app
        And I click the "group1" icon
        Then I see if the text "name 1" exists
        And I click the "filterIcon" icon
        And I click the "alphabeticDSC" icon
        And I click the "Done" icon
        Then I see if the text "name 9" exists
     
     Scenario: Test tab one numericASC sorting feature of the app
         Given I test the initial state of the app
        And I click the "group1" icon
        Then I see if the text "name 1" exists
        And I click the "filterIcon" icon
        And I click the "numericASC" icon
        And I click the "Done" icon
        Then I see if the text "name 14" exists

    Scenario: Test tab one numericDSC sorting feature of the app
        Given I test the initial state of the app
        And I click the "group1" icon
        Then I see if the text "name 1" exists
        And I click the "filterIcon" icon
        And I click the "numericDSC" icon
        And I click the "Done" icon
        Then I see if the text "name 25" exists