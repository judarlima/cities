//
//  CityLocationPresenter.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

protocol CityLocationPresenterLogic: class {
    func showCityLocation(_ city: CityViewModel)
}

final class CityLocationPresenter: CityLocationPresenterLogic {
    var viewController: CityLocationViewController?
    
    func showCityLocation(_ city: CityViewModel) {
        let cityAnnotation = CityAnnotation(viewModel: city)
        viewController?.displayMap(location: cityAnnotation)
    }
}
