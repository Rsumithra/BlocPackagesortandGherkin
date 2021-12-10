Feature:Tab
The Tabscreen has to change when we do swipe

Scenario: Test tab one feature of the app
        Given I test the initial state of the app
        And I click the "group1" icon
        And I scroll the tab
        Then I see if the text "name 25" exists

Scenario: Test tab two feature of the app
        Given I test the initial state of the app
        And I click the "group2" icon
        And I scroll the tab
        Then I see if the text "name 50" exists

