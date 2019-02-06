//
//  MainCoordinator.swift
//  Cities
//
//  Created by Judar Lima on 05/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let presenter = CitiesListPresenter()
        let manager = CitiesManager()
        let interactor = CitiesListInteractor(presenter: presenter, manager: manager)
        let viewController = CitiesListViewController(coordinator: self,
                                                      interactor: interactor,
                                                      presenter: presenter)
        presenter.viewController = viewController
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func cityDetail(viewModel: CityViewModel) {
        let presenter = CityLocationPresenter()
        let interactor = CityLocationInteractor(presenter: presenter)
        let viewController = CityLocationViewController(interactor: interactor,
                                                        presenter: presenter)
        presenter.viewController = viewController
        viewController.bind(viewmodel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
