//
//  ContentView.swift
//  PreviewDemo
//
//  Created by Pin Lu on 2/28/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    VStack(alignment: .leading, spacing: 10) {
                        Image(systemName: "heart")
                        Text("Great idea")
                        Text("Indeed")
                    }
                } header: {
                    Label("Bloom", image: "")
                }
                Section {
                    Image(systemName: "heart")
                } header: {
                    Label("Vignette", image: "")
                }
                Section {
                    Image(systemName: "heart")
                } header: {
                    Label("Saturation", image: "")
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
