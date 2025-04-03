//
//  NetworkService.swift
//  ShapesApp
//
//  Created by Madhusudhan on 01/04/25.
//

import Foundation

protocol NetworkService {
    func fetchData<T: Decodable>(from url: URL, decodeTo type: T.Type) async throws -> T
}

extension NetworkService {
    func fetchData<T: Decodable>(from url: URL, decodeTo type: T.Type) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(T.self, from: data)
        return result
    }
}
