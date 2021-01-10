## New Relic Code Challenge Summary

Create a mobile app (“app”) in Kotlin (Android) or Swift (iOS) that uses the current production version of Android Studio or Xcode respectively and implements an app that displays scrollable lists of cat facts. The app should be able to efficiently show a very long list, and selecting an entry in the list should display more information. The user should be able to navigate back and forth between views. The app should capture performance information that is available in another view via a control of your choice that shows metrics for the average response time of the API calls you make, information about the OS version and device the app is running on, and current memory usage of the app.
Primary Considerations
● Consider user experience and loading time of that experience.
● Let the user know you are fetching/waiting for data.
● App may run on any kind/form factor of device, and it may be rotated.
● The app should work correctly as defined below in Requirements.
● The overall structure of the app should be simple.
● The code of the app should be descriptive and easy to read, and the build method and
runtime parameters must be well-described and work.
● The design should be resilient with regard to network connectivity loss.
● The App and its UI should be optimized for maximum performance and resource usage,
weighed along with the other Primary Considerations and Requirements below.
Requirements
1. Create a new project using the latest version of Android Studio or Xcode.
2. Create a main scrollable text list view that displays names of cats. The data is pageable.
3. Use the Cat Facts API to download facts about cats (​https://catfact.ninja)​
4. Tapping cat names should display additional detail about the cat.
5. For each network call, you capture the response time of that call. You track the average
response time per API endpoint.
6. You detect the device and OS version you are running on.
 
7. You capture the current memory usage of the app.
8. A control of your choice opens a view that displays a list of these metrics and metadata:
a. Each API called during this run and average response time in milliseconds
b. Device make/model
c. OS version
d. Current memory usage of app
9. User can navigate between all views.
10. Be as creative as you wish on the UI presentation.
Notes
● You may write tests at your own discretion. Tests are useful to ensure your app passes the Primary Considerations.
● You may use common libraries in your project, particularly if their use helps improve Application simplicity and readability.
Submission
1. We'll initially test your solution using the latest production version of the Android Studio or Xcode development tools.
2. Include a README in the repo with comments:
a. Clearly state all of the assumptions you made in completing the app
b. If your project requires any components not found in a default install of the
developer tool, you must provide instructions (and automation) to install those
components (or include them in your archive).
c. Any additional special instructions to set up and run project
3. Push the code to a github.com repo and invite the user specified in the email.


### Project Write up

* First I ran out of time to finish what I wanted to for this project.  In order to calculate the average response time I was planning on using a realm DB to store each call then caculate the average on the metrics page.  However I ran into issue using realm with SwiftUI.
* I decided to use swiftUI because I am some what new to it and thought if I am going to do a project like this I might as well learn something new.  
* I used swift package manger for frameworks 
* I spent way to much time working on the list pagination in SwiftUI which was a great learning experince but that ment I didn't have time for unit tests or finishing the api response calcuation.

