[![Stories in Ready](https://badge.waffle.io/audreyseo/pet-rubiks-ios.png?label=ready&title=Ready)](https://waffle.io/audreyseo/pet-rubiks-ios)
# Cube Timer
## About
This is the iOS version of my web-based rubik's cube timer + Fridrich method guide for OLL (orientation of the last layer) and PLL (permutation of the last layer). The repo for my web project is [here][1].

## Features
The following is a list of the features that are currently implemented:
 1. Time cube
  - Start by pressing for more than .5 seconds
  - Stop by tapping
  - New scramble code is generated each time
 2. Delete the last time
  - Swipe left, then verify by clicking "Yes" on the alert that pops up
 3. Generate a new scramble without also starting the time again
  - Swipe right
 4. Show all of the times in a UITableView

### Features Currently in Development
 1. Tab for OLL cases
  - Ability to sort the cases by order of priority
    - Maybe have a way to identify a few that you are prioritizing at once?
  - Hide the cases you've already solved - or otherwise put them in a different part of the table view (grouped?)
 2. Tab for PLL cases
  - With same abilities as the OLL tab
 3. Save your current times from one session of the app to the next
  - Ability to create different "sessions" of times - so you don't have 1000 times all in one place
 4. Save your times to CSV, Excel, etc.
  - Can send to your email or airdrop to computer
 5. Have saved times available to computer in form of CSV
 

[1]: https://github.com/audreyseo/pet-rubiks/
