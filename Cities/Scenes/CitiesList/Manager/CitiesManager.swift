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
    func fetchFilteredCities(with prefix: String, completion: @escaping (Result<[City]>) -> Void)
}

class CitiesManager: CitiesManagerLogic {
    private var citiesList = [City]()
    private var citiesTrie = Trie<City>()
    private let fileName = "cities"
    
    func fetchCities(completion: @escaping (Result<[City]>) -> Void) {
        if !citiesList.isEmpty {
            completion(.success(citiesList))
        }
        else if case let .success(cities) = citiesData() {
            cities.forEach { citiesTrie.insert(word: $0.name, data: $0) }
            
            completion(.success(cities))
        } else {
            completion(.failure(.fileNotFound))
        }
    }
    
    func fetchFilteredCities(with prefix: String, completion: @escaping (Result<[City]>) -> Void) {
        let filteredCities = citiesTrie.findWordsWithPrefix(prefix: prefix)
        completion(.success(filteredCities))
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
            self.citiesList = sortedCities
            return .success(sortedCities)
        } catch {
            return .failure(.unexpected(error.localizedDescription))
        }
    }
    
}
