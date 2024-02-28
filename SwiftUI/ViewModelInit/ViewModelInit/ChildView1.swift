//
//  ChildView1.swift
//  ViewModelInit
//
//  Created by Pin Lu on 2/27/24.
//

import Foundation
import SwiftUI

class ChildViewModel1: ObservableObject {
    @Published var text = "Child View 1"
    
    static var count = 1
    var id: Int
        
    init() { 
        id = Self.count
        Self.count += 1
        print("Child ViewModel 1 (id: \(id)) init") }
    deinit { print("Child ViewModel 1 (id: \(id)) deinit") }
}

struct ChildView1: View {
    @StateObject private var viewModel: ChildViewModel1
    
    // The wrong way to pass the view model and init the @StateObject. The view can not init "@StateObject viewModel"
    // before calling body(). This will be a fake @StateObject.Every time redraw the child view the view model will be created.
    init(viewModel: ChildViewModel1) {
        _viewModel = StateObject(wrappedValue: viewModel)
        print("Child View 1 init")
    }
    
    var body: some View { Text(viewModel.text) }
}
