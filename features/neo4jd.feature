Feature: Daemon Script

  I want to start neo4j in the simplest possible fashion
  So I can uncover the magic
  As someone exploring the product

Background:
  Given I clean up Neo droppings

  Scenario: ask for help
    When I run `./bin/neo4jd -h`
    Then the stdout should contain "Usage: ./bin/neo4jd"
    And the exit status should be 1

  Scenario: do not accept -p on its own
    When I run `./bin/neo4jd -p`
    Then the exit status should not be 0
    And the stdout should contain "Usage"

  Scenario: default behaviour is to start in foreground
    When I run `./bin/neo4jd`
    Then the stdout should contain "Welcome"
    And the exit status should be 0

  Scenario: allow backgrounding with -d and log to default log
    When I run `./bin/neo4jd -d`
    And I wait for 1 second
    Then the file "data/log/console.log" should contain "Welcome"
    And the exit status should be 0

  Scenario: allow backgrounding with a log file
    Given I run `./bin/neo4jd -d -l tmp/foo.log`
    And I wait for 1 second
    Then the file "tmp/foo.log" should contain "Welcome"
    And the exit status should be 0

  Scenario: run in a different directory
    Given I cd to "bin"
    When I run `./neo4jd`
    Then the stdout should contain "Welcome"
    And the exit status should be 0
