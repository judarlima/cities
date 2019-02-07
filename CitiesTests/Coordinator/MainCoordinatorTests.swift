//
//  MainCoordinatorTests.swift
//  CitiesTests
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import XCTest
@testable import Cities

class MainCoordinatorTests: XCTestCase {
    var sut: MainCoordinator!

    override func setUp() {
        sut = MainCoordinator.shared
    }
    
    func testWhenStartThenPresentCitiesListViewController() {
        sut.start()
        
        XCTAssertTrue(
            sut.navigationController.viewControllers.first!.isKind(of: CitiesListViewController.self)
        )
    }
    
    func testWhenCityDetailsThenPresentCityLocationViewController() {
        let viewModel = CityViewModel(city: City(id: 1,
                                                 country: "BR",
                                                 name: "Imperatriz",
                                                 coord: City.Coordinate(lat: 55.3,
                                                                   lon: 78.9)))
        sut.cityDetail(viewModel: viewModel)
        
        XCTAssertTrue(
            sut.navigationController.viewControllers.last!.isKind(of: CityLocationViewController.self)
        )
    }

}
