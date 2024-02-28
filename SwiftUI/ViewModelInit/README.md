There is only one correct way to inject a view model into a view.

struct MyView: view {
  @StateObject var viewModel: MyViewModel

  init(viewModel: @autoclosure @escaping () -> MyViewModel) {
    _viewModel = StateObject(wrappedValue: viewModel())
  }
}
