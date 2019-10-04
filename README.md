# Mars Rover

## Information

I did the actual technical part in 2:45 (with 30 minutes planning before hand so 3:15 total,so this did go over the time limit).

## Next steps

1) First and foremost - more time refactoring the code. I'd like to see if I could tidy the logic in the robot especially.

2) More tests of the 'lost' functionality, I think this was a less good part, and I'd like to look at better was of organising this code.

3) More feature tests - for a wider range of scenarios.

4) I would potentially extract out to a formatter class (rather than give the control_center responsibility for it).

5) Looked at alternative implementations for the move method - the robots tests got very long so it would be good to find ways to extract some of its responsibilities potentially.

6) More time manually testing too, just to make sure that it all links together well.

## To run project

As long as you have ruby installed:

`ruby run.rb`

To run the tests, as long as you have rspec installed on your machine:

`rspec`
