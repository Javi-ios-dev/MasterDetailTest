//
//  APIService.swift
//  MasterDetailTest
//
//  Created by Javier Apaez Arcos on 06/02/25.
//

import Foundation

class APIService {
    func fetchItems(completion: @escaping (Result<[ItemElement], Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let items = try JSONDecoder().decode([ItemElement].self, from: data)
                completion(.success(items))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
