//
//  CitiesManager.swift
//  Cities
//
//  Created by Judar Lima on 05/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

enum CitiesError: Error {
    case fileNotFound
    case unexpected(String)
}

enum Result<T> {
    case success(T)
    case failure(CitiesError)
}

protocol CitiesManagerLogic {
    func fetchCities(completion: @escaping (Result<[City]>) -> Void)
    func fetchTrie(completion: @escaping (Result<Trie<City>>) -> Void)
}

class CitiesManager: CitiesManagerLogic {
    var citiesList = [City]()
    var citiesTrie = Trie<City>()
    
    private let fileName = "cities"
    
    func fetchCities(completion: @escaping (Result<[City]>) -> Void) {
        if case let .success(cities) = citiesData() {
            cities.forEach { citiesTrie.insert(word: $0.name, data: $0) }
        } else {
            completion(.failure(.fileNotFound))
        }
    }
    
    func fetchTrie(completion: @escaping (Result<Trie<City>>) -> Void) {
        completion(.success(citiesTrie))
    }

    private func citiesData() -> Result<[City]> {
        guard
            let filePath = Bundle.main.path(forResource: fileName, ofType: "json")
            else { return .failure(.fileNotFound) }
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath),
                                    options: .mappedIfSafe)
            let citiesModel = try JSONDecoder().decode([City].self, from: jsonData)
            let sortedCities = citiesModel.sorted{ $0.name < $1.name }
            return .success(sortedCities)
        } catch {
            return .failure(.unexpected(error.localizedDescription))
        }
    }
    
}
