<h1 align="center">TMDB Movies iOS App</h1>

*Author:* Carlos Rodriguez Asensio


## Requirements
- Xcode 13.2.1
- Swift 5.0

## Objective
- This is a simple project capable to show a popular movies list and their details using MVVM architecture, reactive programming and unit testing. The app uses the TMDB API (https://developers.themoviedb.org/3/getting-started/introduction).
 
## Installation
- Run the `pod install` command
- Clean and build the project in Xcode

## 3rd-Party Libraries
 - **RxSwift/RxCocoa** - to make reactive binding of API call and response.

## Design pattern
 - **MVVM** - means Model, View, ViewModel. Also, util classes are used like Router or NetworkManager.
 
    - *Model* - defines the API response data.
    - *View* - created with .xib and UIViewController, configures UI.
    - *ViewModel* - business logic, gets the data from service and injects it to the view.
    
    - *Router* - creates and instances the view through the SceneDelegate.
    - *NetworkManager* - responsible for making API calls.
    
    - *Constants* - app useful data. In this case, especially in order to generate the URL.
    - *Tests* - all the files needed to make model and network Unit Testing.
 
 ## Potential improvements
- More information in the detail view. For that, would be neccesary to add a new method in the NetworkManager for getting the movie detail information.
- Add other kind of lists from service, like 'Top Rated' or 'Uncoming'.
- Create our custom lists, selecting our favourite movies.
- Improve the app UI/UX. Add some animations.
- Improve the app Unit Tests and implement UI and Integration Tests.
- Add more languages for the app.
- Use the Optionals struct in the Constants file to create a URL for making a more refined search.
 - Handle error in the NetworkManager (Showing alert. Actually, just printing message).
