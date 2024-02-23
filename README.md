Learn about app dev architecture.

- Use coordinator to extract navigation flow.
- Use ViewModel to extract data and user interaction.
- Try to make the view controller only responsible for displaying views.
- More complex the app, more isolation we need to.


Other Stuff
- One interesting thing I learned is when `loadView()`/`viewDidLoad()` is triggered(). The trigger point is when the view is push, presesnt or modify.
```
let vc = MyViewController()
vc.viewModel = MyViewModel()
navigationController.pushViewController(vc, animated: true)
```
`viewDidLoad()` happen after pushing so it can use viewModel to show data.

But, if we modify the view in ***MyViewController's init***. `viewDidLoad()` execute before assigning the viewModel.
