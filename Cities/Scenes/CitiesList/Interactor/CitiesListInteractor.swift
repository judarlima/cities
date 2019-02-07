//
//  CitiesListInteractor.swift
//  Cities
//
//  Created by Judar Lima on 05/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

protocol CitiesListInteractorLogic: class {
    func listCities()
    func searchCity(with prefix: String)
    func cityLocation(city: CityViewModel)
}

final class CitiesListInteractor: CitiesListInteractorLogic {
    var presenter: CitiesListPresenterLogic?
    var manager: CityManagerLogic?
    
    init(presenter: CitiesListPresenterLogic, manager: CityManagerLogic) {
        self.presenter = presenter
        self.manager = manager
    }
    
    func listCities() {
        manager?.fetchCities(completion: { [weak self] (data) in
            guard let interactor = self else { return }
            switch data {
            case let .success(cities):
                interactor.presenter?.showCitiesList(cities: cities)
            case let .failure(error):
                interactor.presenter?.showError(message: error.localizedDescription)
            }
        })
    }
    
    func cityLocation(city: CityViewModel) {
        MainCoordinator.shared.cityDetail(viewModel: city)
    }
    
    func searchCity(with prefix: String) {
        manager?.fetchFilteredCities(with: prefix, completion: { [weak self] (result) in
            guard let interactor = self else { return }
            switch result {
            case let .success(filtereCities):
                interactor.presenter?.showCitiesList(cities: filtereCities)
            case let .failure(error):
                interactor.presenter?.showError(message: error.localizedDescription)
            }
        })
    }
}
