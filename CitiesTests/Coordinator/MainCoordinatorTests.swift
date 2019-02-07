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
    var navigationController: UINavigationController!

    override func setUp() {
        navigationController = UINavigationController()
        sut = MainCoordinator(navigationController: navigationController)
    }
    
    func testWhenStartThenPresentCitiesListViewController() {
        sut.start()
        
        XCTAssertTrue(
            navigationController.viewControllers.first!.isKind(of: CitiesListViewController.self)
        )
    }
    
    func testWhenCityDetailsThenPresentCityLocationViewController() {
        let viewModel = CityViewModel(city: City(id: 1,
                                                 country: "BR",
                                                 name: "Imperatriz",
                                                 coord: Coordinate(lat: 55.3,
                                                                   lon: 78.9)))
        sut.cityDetail(viewModel: viewModel)
        
        XCTAssertTrue(
            navigationController.viewControllers.first!.isKind(of: CityLocationViewController.self)
        )
    }

}
