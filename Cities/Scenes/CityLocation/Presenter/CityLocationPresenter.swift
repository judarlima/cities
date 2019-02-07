//
//  CityLocationPresenter.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

protocol CityLocationPresenterProtocol: class {
    var viewController: CityLocationDisplayProtocol? {get set}
    func showCityLocation(_ city: CityViewModel)
}

final class CityLocationPresenter: CityLocationPresenterProtocol {
    weak var viewController: CityLocationDisplayProtocol?
    
    func showCityLocation(_ city: CityViewModel) {
        let cityAnnotation = CityAnnotation(viewModel: city)
        viewController?.displayMap(location: cityAnnotation)
    }
}
