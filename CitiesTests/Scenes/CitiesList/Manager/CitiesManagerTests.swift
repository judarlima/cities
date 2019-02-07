//
//  CitiesManagerTests.swift
//  CitiesTests
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import XCTest
@testable import Cities

class CitiesManagerTests: XCTestCase {
    var sut: CityManager!
    var dataHandler: JsonDataHandlerMock!
    
    override func setUp() {
        dataHandler = JsonDataHandlerMock()
        sut = CityManager(dataHandler: dataHandler)
    }
    
    func testWhenDataHandlerReturnsDataThenGeneratesCitiesModel() {
        let managerExpectation = expectation(description: #function)
        let expectedCitiesCount = 6
        let expectedFirstCityName = "Alupka"
        var managerResult = [City]()
        
        sut.fetchCities { (result) in
            if case let .success(cities) = result {
                managerResult = cities
            }
            managerExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 0.3) { (_) in
            XCTAssertEqual(expectedCitiesCount, managerResult.count)
            XCTAssertEqual(expectedFirstCityName, managerResult.first!.name)
        }
    }
    
    func testWhenReceivePrefixThenReturnFilteredCities() {
        let managerExpectation = expectation(description: #function)
        let prefixString = "y"
        let expectedCitiesCount = 1
        let expectedFirstCityName = "Yurevichi"
        var managerResult = [City]()
        
        sut.fetchCities { (_) in } //Call fetch cities to create the prefix trie
        sut.fetchFilteredCities(with: prefixString) { (result) in
            if case let .success(cities) = result {
                managerResult = cities
            }
            managerExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 0.3) { (_) in
            XCTAssertEqual(expectedCitiesCount, managerResult.count)
            XCTAssertEqual(expectedFirstCityName, managerResult.first!.name)
        }
    }
}
