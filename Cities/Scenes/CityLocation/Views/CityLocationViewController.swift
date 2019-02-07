//
//  CityLocationViewController.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit
import MapKit

protocol CityLocationDisplayProtocol {
    func displayMap(location: CityAnnotation)
}

final class CityLocationViewController: UIViewController {
    @IBOutlet private weak var mapView: MKMapView!
    private var viewModel: CityViewModel!
    private var interactor: CityLocationInteractorProtocol?
    
    init(interactor: CityLocationInteractorProtocol) {
        self.interactor = interactor
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

extension CityLocationViewController: CityLocationDisplayProtocol {
    func displayMap(location: CityAnnotation) {
        mapView.addAnnotation(location)
        mapView.setRegion(location.region, animated: true)
    }
}
