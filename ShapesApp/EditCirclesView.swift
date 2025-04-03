//
//  EditCirclesView.swift
//  ShapesApp
//
//  Created by Madhusudhan on 01/04/25.
//

import SwiftUI

struct EditCirclesView: View {
    @ObservedObject var viewModel: ShapesViewModel
    
    var body: some View {
        gridView()
        
        bottomBarButtonsView()
    }
}

private extension EditCirclesView {
    @ViewBuilder
    func gridView() -> some View {
        ScrollView {
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: Padding.padding16), count: 3),
                spacing: Padding.padding16) {
                    ForEach(viewModel.shapes.filter { $0.type == "circle" }) { shape in
                        Circle().fill(Color(hex: "#006994"))
                            .accessibilityIdentifier("EditCircleView")
                    }
                }
                .padding([.leading, .trailing], Padding.padding16)
        }
    }
    
    @ViewBuilder
    func bottomBarButtonsView() -> some View {
        HStack(spacing: Padding.padding16) {
            Button("Delete All") {
                viewModel.shapes.removeAll(where: { $0.type == "circle" })
            }
            Spacer()
            Button("Add") {
                viewModel.addShape("circle")
            }
            Spacer()
            Button("Remove") {
                if let index = viewModel.shapes.lastIndex(where: { $0.type == "circle" }) {
                    viewModel.shapes.remove(at: index)
                }
            }
        }
        .padding(.horizontal, Padding.padding16)
    }
}

struct EditCirclesView_Previews: PreviewProvider {
    static var previews: some View {
        EditCirclesView(viewModel: ShapesViewModel())
    }
}
