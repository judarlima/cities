//
//  CitiesListInteractorTests.swift
//  CitiesTests
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import XCTest
@testable import Cities

class CitiesListInteractorTests: XCTestCase {
    var sut: CitiesListInteractorLogic!
    var presenter: CitiesPresenterMock!
    var manager: CitiesManagerMock!
    
    override func setUp() {
        presenter = CitiesPresenterMock()
        manager = CitiesManagerMock(dataHandler: JsonDataHandlerMock())
        sut = CitiesListInteractor(presenter: presenter,
                                   manager: manager)
    }
    
    func testListCitiesThenPresenterShowCitiesList() {
        let expectedNumberOfCities = 6
        let expectedFirstCitieName = "Alupka"
        
        sut.listCities()
        
        XCTAssertEqual(expectedNumberOfCities, presenter.cities.count)
        XCTAssertEqual(expectedFirstCitieName, presenter.cities[0].name)
        XCTAssertTrue(presenter.errorMessage.isEmpty)
        
    }
    
    func testFilterCitiesThenPresenterShowFilteredCities() {
        let filterString = "G"
        let expectedNumberOfCities = 1
        let expectedFirstCityName = "Gumist’a"
        
        sut.searchCity(with: filterString)
        
        XCTAssertEqual(expectedNumberOfCities, presenter.cities.count)
        XCTAssertEqual(expectedFirstCityName, presenter.cities.first!.name)
        XCTAssertTrue(presenter.errorMessage.isEmpty)
    }
}
