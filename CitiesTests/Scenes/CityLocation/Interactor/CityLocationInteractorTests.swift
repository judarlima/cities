//
//  CityLocationInteractorTests.swift
//  CitiesTests
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import XCTest
@testable import Cities

class CityLocationInteractorTests: XCTestCase {
    var sut: CityLocationInteractorProtocol!
    var presenter: CityLocationPresenterMock!
    
    override func setUp() {
        presenter = CityLocationPresenterMock()
        sut = CityLocationInteractor(presenter: presenter)
    }
    
    func testWhenCallLocationThenPresenterShowCityLocationViewModel() {
        let expectedPresentedViewModel = CityViewModel(city: City(id: 1,
                                                                  country: "NL",
                                                                  name: "Amsterdam",
                                                                  coord: City.Coordinate(lat: 90.0,
                                                                                         lon: 95.3)))
        sut.location(from: expectedPresentedViewModel)
        
        XCTAssertEqual(expectedPresentedViewModel, presenter.presentedViewModel)
    }
}
