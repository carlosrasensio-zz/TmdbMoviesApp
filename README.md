# TmdbMoviesApp

**APP INFORMATION**

- Architecture: MVVM
- Reactive programming: RXSwift/RxCocoa
- Service source: TMDB
    - Get Popular: get a list of the current popular movies on TMDB. This list updates daily.
    - UIImageView extension to get image from service, using the image path from the movie information.



**POSSIBLE FUTURE IMPLEMENTATIONS**

- More information in the detail view. For that, would be neccesary to add a new method in the NetworkManager for getting the movie detail information.
- Add other kind of lists from servicem, like 'Top Rated' or 'Uncoming'.
- Create our custom lists, selecting our favourite movies.
- Improve the app UI/UX.
- Add more languages for the app.
- Use the Optionals struct in the Constants file to create a URL for making a more refined search.
