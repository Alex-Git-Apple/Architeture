# Learn About App Dev Architecture.

- Use coordinator to extract navigation flow.
- Use ViewModel to extract data and user interaction.
- Try to make the view controller only responsible for displaying views.
- More complex the app, more isolation we need to.



# Other Stuff
## `loadView()`/`viewDidLoad()`
One interesting thing I learned is when `loadView()`/`viewDidLoad()` is triggered(). The trigger point is when the view is pushed, presesnted or modified.
  ```
  let vc = MyViewController()
  vc.viewModel = MyViewModel()
  navigationController.pushViewController(vc, animated: true)
  ```
  `viewDidLoad()` happen after pushing so it can use viewModel to show data.
  
  But, if we modify the view in ***MyViewController's init***. `viewDidLoad()` execute before assigning the viewModel.

## Property observer
During initialization, properties are typically set directly, bypassing any property observers.
In the following example didSet takes effect after init()
  ```
  class MovieCellViewModel: ObservableObject {
      
      @Published var likeButtonImage: String = ""
      var name: String
      var favorite: Bool {
          didSet {
              likeButtonImage = favorite ? "heart.fill" : "heart"
          }
      }
      
      init(_ movie: Movie) {
          name = movie.name
          favorite = movie.favorite
          likeButtonImage = favorite ? "heart.fill" : "heart"
      }
  
  }
  ```
