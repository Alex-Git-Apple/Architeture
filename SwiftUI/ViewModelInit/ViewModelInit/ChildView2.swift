//
//  ChildView2.swift
//  ViewModelInit
//
//  Created by Pin Lu on 2/27/24.
//

import Foundation
import SwiftUI

class ChildViewModel2: ObservableObject {
    @Published var text = "Child View 2"
        
    init() { print("Child ViewModel 2 init") }
    deinit { print("Child ViewModel 2  deinit") }
}

struct ChildView2: View {
    @StateObject private var viewModel: ChildViewModel2
    
    // The only correct way to inject a view model. @autoclosure can delay the init until the moment body() is invoked.
    // When the parent view redraw the child view, the view model can stay alive.
    init(viewModel: @autoclosure @escaping () -> ChildViewModel2) {
        _viewModel = StateObject(wrappedValue: viewModel())
        print("Child View 2 init")
    }
    
    var body: some View { Text(viewModel.text) }
}
