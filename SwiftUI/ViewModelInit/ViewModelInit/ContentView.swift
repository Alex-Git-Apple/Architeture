//
//  ContentView.swift
//  ViewModelInit
//
//  Created by Pin Lu on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    @State var isOn = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ChildView1(viewModel: ChildViewModel1())
                ChildView2(viewModel: ChildViewModel2())
                
                // This code is change the hierarchy of the root view.
                // Therefore all child views are created completely,
                if isOn { Text("is on") }
                Button("Trigger") { isOn.toggle() }
            }
        }
    }
    
}

#Preview {
    ContentView()
}
