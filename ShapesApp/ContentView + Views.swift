//
//  ContentView + Views.swift
//  ShapesApp
//
//  Created by Madhusudhan on 01/04/25.
//

import SwiftUI

extension ContentView {
    @ViewBuilder
    func topNavigationBar() -> some View {
        HStack(alignment: .center) {
            Button("Clear All") {
                viewModel.clearShapes()
            }
            Spacer()
            NavigationLink(destination: EditCirclesView(viewModel: viewModel)) {
                Text("Edit Circles")
                
            }
        }
        .padding(.horizontal, Padding.padding16)
        .padding(.top, Padding.padding16)
    }
    
    @ViewBuilder
    func gridView() -> some View {
        ScrollView {
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: Padding.padding16), count: 3),
                spacing: Padding.padding16) {
                    ForEach(viewModel.shapes) { shape in
                        ShapeView(shape: shape.type)
                    }
                }
                .padding([.leading, .trailing], Padding.padding16)
        }
    }
    
    @ViewBuilder
    func bottomButtons() -> some View {
        HStack(spacing: Padding.padding16) {
            ForEach(viewModel.shapeButtons) { button in
                Button(action: {
                    viewModel.addShape(button.draw_path)
                }) {
                    Text(button.name)
                        .frame(maxWidth: .infinity,
                               alignment: button.name == viewModel.shapeButtons.first?.name ? .leading : button.name == viewModel.shapeButtons.last?.name ? .trailing : .center)
                }
            }
        }
        .frame(height: 44)
        .padding(.horizontal, Padding.padding16)
    }
}
