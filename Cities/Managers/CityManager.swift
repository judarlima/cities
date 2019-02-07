//
//  CitiesManager.swift
//  Cities
//
//  Created by Judar Lima on 05/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

protocol CityManagerLogic {
    func fetchCities(completion: @escaping (Result<[City]>) -> Void)
    func fetchFilteredCities(with prefix: String, completion: @escaping (Result<[City]>) -> Void)
}

final class CityManager: CityManagerLogic {
    private var citiesList = [City]()
    private var citiesTrie = Trie<City>()
    private var dataHandler: DataHandler?
    
    init(dataHandler: DataHandler) {
        self.dataHandler = dataHandler
    }
    
    func fetchCities(completion: @escaping (Result<[City]>) -> Void) {
        if citiesList.isEmpty {
            generateCities { [weak self] (result) in
                if case let .success(cities) = result {
                    self?.citiesList = cities
                    cities.forEach { self?.citiesTrie.insert(word: $0.name, data: $0) }
                    completion(.success(cities))
                } else {
                    completion(.failure(.fileNotFound))
                }
            }
        } else {
            completion(.success(citiesList))
        }
    }
    
    func fetchFilteredCities(with prefix: String, completion: @escaping (Result<[City]>) -> Void) {
        let filteredCities = citiesTrie.findWordsWithPrefix(prefix: prefix)
        completion(.success(filteredCities))
    }
    
    private func generateCities(completion: @escaping (Result<[City]>) -> Void) {
        dataHandler?.loadData(completion: { (result) in
            switch result {
            case let .success(data):
                do {
                    let citiesModel = try JSONDecoder().decode([City].self, from: data)
                    completion(.success(citiesModel))
                } catch {
                    completion(.failure(.couldNotParseObject))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        })
    }    
}
