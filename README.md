# XcodeLocationIssueExample

UITest does not pickup simulated location setup up in scheme when running from Xcodebuild

## Background
As part of our effort to move our CI from a locally run Jenkins to GitHub actions, we are trying to run all UITests from command line without touching the Xcode UI. Some of our UI Tests require a simulated location so we have setup a simulated location in the scheme, as shown below

//schemeLocationSetting.png

We then run the UITests from Xcode and everything is OK

However when we try to run it from the command line, using Xcodebuild, it no longer seem to pick up the location. The test that rely on receiving a simulated location fail as a result.

Detailed steps to reproduce are given further below

## Configuration 
We tested using Xcode 11.4 on a MacBook Pro (15-inch, 2017) running macOS version  10.15.4 (19E287) (Catolina)
Simulator version iPhone 11 Pro running iOS 13.4

## Steps to reproduce

0. Clone the github project
1. Start the simulator "iPhone 11 Pro"
2. On the simulator menu, features, location, make sure ‘None’ is selected
3. On the simulator menu, Under device, choose “Erase all content and settings”
4. Start Xcode
5. Run the UI Tests
6. All the tests should be green
7. On the simulator menu, features, location, make sure ‘None’ is selected
8. On the simulator menu, Under device, choose “Erase all content and settings”
9. Open the terminal
10. go to the directory where the project has been cloned
11. Run the UI test from the command line with the following command: 

    xcodebuild -destination "platform=iOS Simulator,name=iPhone 11 Pro" -scheme LocIssue  test 
    
12: The UI Tests fail

It looks like when running from Xcodebuild, the location setup in the scheme is not picked up
