//
//  CitiesPresenterMock.swift
//  CitiesTests
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation
@testable import Cities

class CitiesPresenterMock: CitiesListPresenterProtocol {
    var viewController: CitiesListDisplayProtocol?
    var errorMessage: String = ""
    var cities: [City] = [City]()

    func showError(message: String) {
        self.errorMessage = message
    }
    
    func showCitiesList(cities: [City]) {
        self.cities = cities
    }
}
