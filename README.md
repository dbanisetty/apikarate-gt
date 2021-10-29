== API tests with Karate BDD  ==

# prerequisites
Java sdk installed
apache maven installed


# run in cli
mvn clean verify

# run specific scenario(by tag name)
mvn clean verify -Dcucumber.options="--tags @your-tag-name"
just tag with "@ignore" for feature files that you dont want to run

# run from IDE
simple click on run icon or right click on "TestRunner" class and select run option

# reporting
integrated cucumber html reports
Report can be found under "target -> cucumber-html-reports" folder

# Test summary
Framework demonstrates Api testing with Karate BDD dsl
Used Examples table to pass different query params in the request
Commonly used functions like date, url are from configured in config.js file
multiple environments can be controlled from config.js
command for selecting an env when multipleenvironments are present
 -  mvn clean verify -Dkarate.env=<<env_key>>

#Limitations
- The "Feature" and "Scenario" names are as per my understanding so may not reflect the true purpose of the api
- Tried to cover assertion varieties, but haven't asserted response values to great extent





