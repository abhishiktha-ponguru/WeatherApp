# WeatherApp
WeatherApp is an iOS application used with Open Weather API which will forecast the 5 days weather report of the current location with 3 hour interval and can give the weather report of the any country or city entered.
Note: This app allows user to query for between 3 to 7 countries.

## Installation
This can easily insatlled in 2 ways
1. Clone the link
2. Download the project directly

Once downloaded or cloned one can directly run the application by selecting any available simulator, as this project is not depending on thrid libraried or pods its easy to execute.

## Project Details
This project is developed using MVVM pattern
API client with POP(Protocol Oriented Programming) used for making server calls are native and using the URLSession.
Used today's best practices like generics, Codable, Extensions, MVVM, Computed properties and also OOPS concepts for ENDPoint class which ever new client is required it can be easily created by overriding the required properties.

Constants are created for the application places
Used TableView to the show the Weather result in both forecast and weatherDetails mode
Computed properties are used in the model which will give the leverage to keep the codable keys as it as and access the user required data with ease.
Reachabiliy class for network change
LocationManager class for the location request and authorization change observation.

Unit test cases are being added for the possible places and the code coverage has been done as much as possible, ofcourse the 100% coverage is not possible in the real world but tried to cover as much as possible due to the time constraint.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
