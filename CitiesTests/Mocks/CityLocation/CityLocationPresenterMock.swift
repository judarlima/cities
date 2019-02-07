//
//  CityLocationPresenterMock.swift
//  CitiesTests
//
//  Created by Judar Lima on 07/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

@testable import Cities

class CityLocationPresenterMock: CityLocationPresenterProtocol {
    var viewController: CityLocationDisplayProtocol?
    var presentedViewModel: CityViewModel?
    
    func showCityLocation(_ city: CityViewModel) {
        self.presentedViewModel = city
    }
}

