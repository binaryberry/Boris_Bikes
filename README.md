Boris Bikes
======================

## What is it?
A Ruby program modeling London's bike rental scheme, to help manage docking station capacity and bike repairs. This was written during my second and third weeks at Makers Academy.

## How was it done?

After a short brief, my teammates and I used class-responsibility-collaboration cards to determine how the program would be structured, in terms of the classes we would need and their responsibilities.

We then started pair-programming to write the first tests and make them pass.

The programme handles the interactions between the user, the docking station, the van and the garage, for scenarios such as hiring a bike, transporting the bike from the docking station to the garage, getting the bike repaired, etc. Since the Garage, the Van and the Docking Station class had very similar properties, we exported their common functionalities to a module called "Bike container".

## Which technologies were used?

- Ruby
- Rspec

## What did I learn?
- London vs. Chicago-style of testing
- SOLID principles, in particular Single Responsibility Principle and Liskov Substitution Principle
- Handling errors and exceptions
- Using IRB or PRY to see the program in action

![Boris](https://github.com/binaryberry/My_Boris_Bikes/blob/master/Public/Boris_and_Schwarzy.jpg)
