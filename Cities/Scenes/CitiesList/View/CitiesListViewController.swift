//
//  CitiesListViewController.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit

class CitiesListViewController: UIViewController {
    private weak var presenter: CitiesListPresenterLogic?
    private weak var interactor: CitiesListInteractorLogic?
    private var viewModel = [CityViewModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    init(interactor: CitiesListInteractorLogic,
         presenter: CitiesListPresenterLogic) {
        super.init(nibName: "CitiesListViewController", bundle: Bundle.main)
        self.presenter = presenter
        self.interactor = interactor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CitiesListViewController: CitiesListDisplayLogic {
    func displayError(message: String) {
        //
    }
    
    func displayCities(viewModel: [CityViewModel]) {
        self.viewModel = viewModel
    }
}
