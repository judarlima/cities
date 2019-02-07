//
//  CityLocationViewControllerMock.swift
//  CitiesTests
//
//  Created by Judar Lima on 07/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

@testable import Cities

class CityLocationViewControllerMock: CityLocationDisplayProtocol {
    var displayedLocation: CityAnnotation?
    
    func displayMap(location: CityAnnotation) {
        self.displayedLocation = location
    }
}
