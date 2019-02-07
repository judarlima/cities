//
//  CitiesManagerMock.swift
//  CitiesTests
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation
@testable import Cities

class CitiesManagerMock: CitiesManagerLogic {
    private var citiesList = [City]()
    private var citiesTrie = Trie<City>()
    private var dataHandler: DataHandler?
    
    init(dataHandler: DataHandler = JsonDataHandlerMock()) {
        self.dataHandler = dataHandler
        generateCities { [weak self] (result) in
            if case let .success(cities) = result {
                self?.citiesList = cities
                cities.forEach { self?.citiesTrie.insert(word: $0.name, data: $0) }
            } else {
                fatalError("Could not found cities result.")
            }
        }
    }
    
    func fetchCities(completion: @escaping (Result<[City]>) -> Void) {
        completion(.success(citiesList))
    }
    
    func fetchFilteredCities(with prefix: String, completion: @escaping (Result<[City]>) -> Void) {
        let filteredCities = citiesTrie.findWordsWithPrefix(prefix: prefix)
        completion(.success(filteredCities))
    }
    
    private func generateCities(completion: @escaping (Result<[City]>) -> Void) {
        dataHandler?.loadData(completion: { (result) in
            if case let .success(data) = result {
                do {
                    let citiesModel = try JSONDecoder().decode([City].self, from: data)
                    completion(.success(citiesModel))
                } catch {
                    fatalError("Could not parse data")
                }
            }
        })
    }
}
