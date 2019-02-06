//
//  CityLocationViewController.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit
import MapKit

class CityLocationViewController: UIViewController {
    @IBOutlet private weak var mapView: MKMapView!
    private var viewModel: CityViewModel!
    private var interactor: CityLocationInteractor?
    
    init(city: CityViewModel) {
        self.viewModel = city
        super.init(nibName: "CityLocationViewController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.location(from: viewModel)
    }
    
    func displayMap(location: CityAnnotation) {
        mapView.addAnnotation(location)
        mapView.setRegion(location.region, animated: true)
    }
    
}

class CityLocationInteractor {
    func location(from city: CityViewModel) {
        let presenter = CityLocationPresenter()
        presenter.showCityLocation(city)
    }
}

class CityLocationPresenter {
    var viewController: CityLocationViewController?
    
    init(<#parameters#>) {
        <#statements#>
    }
    
    func showCityLocation(_ city: CityViewModel) {
        let cityAnnotation = CityAnnotation(viewModel: city)
        viewController?.displayMap(location: cityAnnotation)
    }
}
