Cube Timer
==========

[![Stories in Ready](https://badge.waffle.io/audreyseo/pet-rubiks-ios.png?label=ready&title=Ready)](https://waffle.io/audreyseo/pet-rubiks-ios)

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
 5. Tab for OLL cases
  - Ability to sort the cases by order of priority
  - Hide the cases you've already solved - or otherwise put them in a different part of the table view (grouped?)
 6. Tab for PLL cases
  - With same abilities as the OLL tab
 7. Save your current times from one session of the app to the next
  - Ability to create different "sessions" of times - so you don't have 1000 times all in one place
  - Ability to switch from different sessions
  - Can use the day's date in order to name sessions
 8. Save your times to CSV, Excel, etc.
  - Currently only have CSV
  - Can send to your email or airdrop to computer
  - Uses name of the session to name the CSV file
 9. Show statistics in a table view

### Features Currently in Development
 1. Way to identify PLL/OLL cases that you want to prioritize
  - stars maybe?
 2. Have saved times available to computer in form of CSV
  - Through iTunes document sharing
  - So you can download everything all at once
 3. Be able to export to a number of formats
  - Even open up a file in the Numbers app if you have it
  - Google sheets
  - Provide export to Excel vs CSV
 

[1]: https://github.com/audreyseo/pet-rubiks/
