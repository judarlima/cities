//
//  CitiesListPresenter.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

protocol CitiesListPresenterProtocol: class {
    var viewController: CitiesListDisplayProtocol? {get set}
    func showCitiesList(cities: [City])
    func showError(message: String)
}

final class CitiesListPresenter: CitiesListPresenterProtocol {
    var viewController: CitiesListDisplayProtocol?
    
    func showError(message: String) {
        viewController?.displayError(message: message)
    }
    
    func showCitiesList(cities: [City]) {
        let viewModel = cities.map { CityViewModel(city: $0) }
        viewController?.displayCities(viewModel: viewModel)
    }
}
