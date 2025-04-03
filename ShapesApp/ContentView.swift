//
//  ContentView.swift
//  ShapesApp
//
//  Created by Madhusudhan on 01/04/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ShapesViewModel()
    
    var body: some View {
        NavigationStack {
            topNavigationBar()
            
            gridView()
            
            bottomButtons()
        }
        .onAppear {
            Task {
                await viewModel.fetchShapes()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
