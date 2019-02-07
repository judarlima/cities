//
//  CityLocationInteractor.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

protocol CityLocationInteractorProtocol {
    func location(from city: CityViewModel)
}

final class CityLocationInteractor: CityLocationInteractorProtocol {
    private var presenter: CityLocationPresenterProtocol
    
    init(presenter: CityLocationPresenterProtocol) {
        self.presenter = presenter
    }
    
    func location(from city: CityViewModel) {
        presenter.showCityLocation(city)
    }
}
