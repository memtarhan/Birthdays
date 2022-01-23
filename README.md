# Birthdays

##### How to install and run

> Clone the repo to a computer with MacOS operating system. To run the project you should have Xcode installed. Open file with extension of "xcworkspace" , select a simulator at top and run it. If you wish to run it on your device, you need to change bundle identifier to make it available for your account.



### Technical Details

* **VIPER** design pattern with modern dependecy injection methods is applied.
  * VIPER is much more scale-friendly and easier to debug and/or find bugs if any.
  * Having dependency injection makes the code cleaner, that's why I went with VIPER and DI
* **Alamofire** framework is used for API(Network) calls.
  * Alamofire uses URLSession library' funtionalities very well and it makes API calls faster.
* **Swinject** framework is used to have dependecy injection.
  * One of the best DI frameworks out there and I'm very comfortable with it, maybe I could get out of my comfort-zone but there was no time :) 



#### TO BE IMPROVED

* A photo signature view is used in two different views(screens). That view has a label in it but label is eventually seperated. A custom view with circle shape, label in middle and gray background will be very useful to implement.
* A general use of fonts would be much helpful. An extension to UIFont with custom fonts and sizes would make designing the app much easier and good to scale up.
* When an error occurs during API call, an alert is show with a dismiss button, there could be a "Try again" button for a better UX
* More tests, I just tested a small functionality because of time. But there are many things that should be tested in the app.