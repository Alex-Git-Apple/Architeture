//
//  ContentView.swift
//  LazyView
//
//  Created by Pin Lu on 2/28/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            // Add a wrapper to prevent NavigationLink init the DetailView.
            // This is bad becuase a new DetailView will be created by tapping.
            //                NavigationLink(destination: LazyView(DetailView())) {
            //                    Text("Link")
            //                }

            // Create DetailView before clicking.
            // Content View never change so the DetailView is created once.
            //                NavigationLink(destination: DetailView()) {
            //                    Text("Link")
            //                }
            
            
            List {
                ForEach(0..<3, id: \.self) { _ in
                    DetailView()
                }
            }
        }
    }
}



struct DetailView: View {
    static var count = 0
    var id: Int
    
    init() {
        id = Self.count
        print("Init the Detail View - \(id).")
        Self.count += 1
    }

    var body: some View {
        Text("Hello \(id)")
    }
}

class DetailViewModel: ObservableObject {

    @Published var name = "John"

//    private let heavyClient = someHeavyService()

    init() { print("INIT VM") }

    deinit { print("DEINIT VM") }
}

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

#Preview {
    ContentView()
}


