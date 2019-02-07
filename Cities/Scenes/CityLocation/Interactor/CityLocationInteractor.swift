//
//  CityLocationInteractor.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

protocol CityLocationInteractorLogic {
    func location(from city: CityViewModel)
}

final class CityLocationInteractor: CityLocationInteractorLogic {
    private var presenter: CityLocationPresenterLogic
    
    init(presenter: CityLocationPresenterLogic) {
        self.presenter = presenter
    }
    
    func location(from city: CityViewModel) {
        presenter.showCityLocation(city)
    }
}
