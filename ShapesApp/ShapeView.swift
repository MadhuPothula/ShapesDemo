//
//  ShapeView.swift
//  ShapesApp
//
//  Created by Madhusudhan on 01/04/25.
//

import SwiftUI

struct ShapeView: View {
    let shape: String
    private let seaBlue: Color = Color(hex: "#006994")
    
    var body: some View {
        createShape()
    }
}

private extension ShapeView {
    func createShape() -> some View {
        Group {
            if shape == "circle" {
                Circle()
                    .fill(seaBlue)
            } else if shape == "square" {
                Rectangle()
                    .fill(seaBlue)
            } else if shape == "triangle" {
                Triangle().fill(seaBlue)
            }
        }
        .aspectRatio(contentMode: .fit)
        .accessibilityIdentifier("ShapeView")
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView(shape: "circle")
    }
}
