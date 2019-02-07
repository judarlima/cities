//
//  CitiesListPresenterTests.swift
//  CitiesTests
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import XCTest
@testable import Cities

class ViewControllerMock: CitiesListDisplayLogic {
    var errorMessage = ""
    var viewModel = [CityViewModel]()
    
    func displayError(message: String) {
        self.errorMessage = message
    }
    
    func displayCities(viewModel: [CityViewModel]) {
        self.viewModel = viewModel
    }
}

class CitiesListPresenterTests: XCTestCase {
    var sut: CitiesListPresenter!
    var viewController: ViewControllerMock!
    
    override func setUp() {
        sut = CitiesListPresenter()
        viewController = ViewControllerMock()
        sut.viewController = viewController
    }
    
    func testWhenShowCitiesListThenViewControllerDisplayCitiesViewModel() {
        let coord = City.Coordinate(lat: 100.0, lon: 19.009)
        let cities = [City(id: 1, country: "BR", name: "São Paulo",coord: coord),
                      City(id: 2, country: "US", name: "New York", coord: coord),
                      City(id: 3, country: "NL", name: "Amsterdam", coord: coord)]
        let expectedFirstName = cities.first!.name + ", " + cities.first!.country
        let expectedViewModelCount = 3
        let expectedLat = "100.0"
        let expectedLon = "19.009"
        
        sut.showCitiesList(cities: cities)
        
        XCTAssertEqual(expectedFirstName, viewController.viewModel.first!.name)
        XCTAssertEqual(expectedLat, viewController.viewModel.first!.lat)
        XCTAssertEqual(expectedLon, viewController.viewModel.first!.lon)
        XCTAssertEqual(expectedViewModelCount, viewController.viewModel.count)
        XCTAssertTrue(viewController.errorMessage.isEmpty)
    }
    
    func testWhenShowErrorThenViewControllerDisplayErrorMessage() {
        let expectedError = CitiesError.unexpected.localizedDescription
        
        sut.showError(message: CitiesError.unexpected.localizedDescription)
        
        XCTAssertEqual(expectedError, viewController.errorMessage)
        XCTAssertTrue(viewController.viewModel.isEmpty)
    }
}
