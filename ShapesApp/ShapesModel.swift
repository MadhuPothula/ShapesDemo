//
//  ShapesModel.swift
//  ShapesApp
//
//  Created by Madhusudhan on 01/04/25.
//

import Foundation
import UIKit

struct ShapeButton: Codable, Identifiable {
    var id: UUID
    let name: String
    let draw_path: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case draw_path
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.draw_path = try container.decode(String.self, forKey: .draw_path)
        self.id = UUID()
    }
}

// Model for each shape instance
struct ShapeItem: Identifiable, Equatable {
    let id = UUID()
    let type: String
}
