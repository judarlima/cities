//
//  CitiesListInteractor.swift
//  Cities
//
//  Created by Judar Lima on 05/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

struct CityViewModel {
    init(_ city: City) { }
}

protocol CitiesListPresenterLogic: class {
    func showCitiesList(viewModel: [CityViewModel])
    func showError(message: String)
}

protocol CitiesListInteractorLogic: class {
    func listCities()
    func searchCity(with prefix: String)
}

class CitiesListInteractor: CitiesListInteractorLogic {
    var presenter: CitiesListPresenterLogic?
    var manager: CitiesManagerLogic?
    
    init(presenter: CitiesListPresenterLogic, manager: CitiesManagerLogic) {
        self.presenter = presenter
        self.manager = manager
    }
    
    func listCities() {
        manager?.fetchData(completion: { (data) in
            switch data {
            case let .success(cities):
                let viewModel = cities.map { CityViewModel($0) }
                presenter?.showCitiesList(viewModel: viewModel)
            case let .failure(error):
                presenter?.showError(message: error.localizedDescription)
            }
        })
    }
    
    func searchCity(with prefix: String) {
        //
    }
}
