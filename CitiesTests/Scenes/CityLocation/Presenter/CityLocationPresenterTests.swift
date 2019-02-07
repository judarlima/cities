//
//  CItyLocationPresenterTests.swift
//  CitiesTests
//
//  Created by Judar Lima on 07/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import XCTest
@testable import Cities

class CityLocationPresenterTests: XCTestCase {
    var sut: CityLocationPresenterProtocol!
    var viewController: CityLocationViewControllerMock!
    
    override func setUp() {
        sut = CityLocationPresenter()
        viewController = CityLocationViewControllerMock()
        sut.viewController = viewController
    }
    
    func testWhenShowCityLocationThenViewControllerDisplayLocation() {
        let viewModel = CityViewModel(city: City(id: 1,
                                                                  country: "NL",
                                                                  name: "Amsterdam",
                                                                  coord: City.Coordinate(lat: 90.0,
                                                                                         lon: 95.3)))
        let expectedLocation = CityAnnotation(viewModel: viewModel)
        
        sut.showCityLocation(viewModel)
        
        XCTAssertEqual(expectedLocation.coordinate.latitude, viewController.displayedLocation?.coordinate.latitude)
        XCTAssertEqual(expectedLocation.coordinate.longitude, viewController.displayedLocation?.coordinate.longitude)
        XCTAssertEqual(expectedLocation.title!, viewController.displayedLocation?.title!)
    }
}
