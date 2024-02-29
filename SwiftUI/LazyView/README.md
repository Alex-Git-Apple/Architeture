LazyView wrapper can prevent the NavigationLink init DetailView in the RootView. But it also diminishes
the SwiftUI optimization.

I accidently find another issue. 
ForEach(0..<3) { DetailView() } creates the DetailView 6 times.
I need to figure out why.
