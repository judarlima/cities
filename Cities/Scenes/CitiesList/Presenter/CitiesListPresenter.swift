//
//  CitiesListPresenter.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

protocol CitiesListPresenterLogic: class {
    var viewController: CitiesListDisplayLogic? {get set}
    func showCitiesList(cities: [City])
    func showError(message: String)
}

final class CitiesListPresenter: CitiesListPresenterLogic {
    var viewController: CitiesListDisplayLogic?
    
    func showError(message: String) {
        viewController?.displayError(message: message)
    }
    
    func showCitiesList(cities: [City]) {
        let viewModel = cities.map { CityViewModel(city: $0) }
        viewController?.displayCities(viewModel: viewModel)
    }
}
