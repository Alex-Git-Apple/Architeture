Learn about app dev architecture.

One interesting thing I learned is when loadView()/ViewDidLoad() is triggered(). The trigger point is when the view is push, presesnt or modify.
let vc = MyViewController()
vc.viewModel = MyViewModel()
navigationController.pushViewController(vc, animated: true)
`ViewDidLoad()` happen after pushing so it can use viewModel to show data.

But, if we modify the view in MyViewController() init. ViewDidLoad() execute before assigning the viewModel.
