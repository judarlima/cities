//
//  CityLocationViewController.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit
import MapKit

protocol CityLocationDisplayLogic {
    func displayMap(location: CityAnnotation)
}

class CityLocationViewController: UIViewController {
    @IBOutlet private weak var mapView: MKMapView!
    private var viewModel: CityViewModel!
    private var interactor: CityLocationInteractorLogic?
    private weak var presenter: CityLocationPresenterLogic?
    
    init(interactor: CityLocationInteractorLogic,
         presenter: CityLocationPresenterLogic) {
        self.interactor = interactor
        self.presenter = presenter
        super.init(nibName: "CityLocationViewController", bundle: Bundle.main)
    }
    
    func bind(viewmodel: CityViewModel) {
        self.viewModel = viewmodel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.location(from: viewModel)
    }
}

extension CityLocationViewController: CityLocationDisplayLogic {
    func displayMap(location: CityAnnotation) {
        mapView.addAnnotation(location)
        mapView.setRegion(location.region, animated: true)
    }
}
