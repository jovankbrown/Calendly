# Calendly Automation Test

The automated test cases would be a part of the tic tac toe regression suite of tests. 
They would be run after each build which pushes code from the test environment into UAT/Staging or the Production environment. The regression suite of tests would be included in the production/UAT build. It would run on the version of the solution in the test environment and if the suite of tests fails, the build would in turn fail. The build will be configured/scheduled using Jenkins. The suite would be triggered both automatically when the build is kicked off or manually via Jenkins UI.


## Author

Jovan Brown

## Usage

```ruby
require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'

class CalendlyAutomation < Test::Unit::TestCase

  def test_01_e2e
      ...
    end
  def test_02_Validations
      ...
    end
  def test_03_winningMessage
      ...
    end   
end

```

## test_01_e2e
End to end test which validates the system produces a tic tac toe board.

## test_02_Validations
End to end test which validates the system produces a tic tac toe board with the number of columns and rows equal to the number entered.

## test_03_winningMessage
End to end test which validates the system produces a tic tac toe board then 
validates the winner(x) receives a message stating “Congratulations player X! You've won. Refresh to play again!”
  