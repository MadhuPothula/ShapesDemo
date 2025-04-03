//
//  ShapesViewModel.swift
//  ShapesApp
//
//  Created by Madhusudhan on 01/04/25.
//

import Foundation

class ShapesViewModel: ObservableObject {
    
    @Published var shapeButtons: [ShapeButton] = []
    @Published var shapes: [ShapeItem] = []
    
    func addShape(_ shape: String) {
        shapes.append(ShapeItem(type: shape))
    }
    
    func clearShapes() {
        shapes.removeAll()
    }
}

//MARK: - Network call
extension ShapesViewModel: NetworkService {
    func fetchShapes() async {
        guard let url = URL(string: "http://staticcontent.cricut.com/static/test/shapes_001.json") else { return }
        
        do {
            let data = try await fetchData(from: url, decodeTo: [String: [ShapeButton]].self)
            await updateShapeButtons(data["buttons"] ?? [])
        } catch {
            print("Failed to fetch or decode shapes: \(error)")
        }
    }
    
    @MainActor
    private func updateShapeButtons(_ buttons: [ShapeButton]) {
        self.shapeButtons = buttons
    }
}
