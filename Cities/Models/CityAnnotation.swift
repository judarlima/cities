//
//  CityAnnotation.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import MapKit

final class CityAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(viewModel: CityViewModel) {
        self.coordinate = CLLocationCoordinate2D(latitude: Double(viewModel.lat) ?? 0,
                                                 longitude: Double(viewModel.lon) ?? 0)
        self.title = viewModel.name
        super.init()
    }
    
    var region: MKCoordinateRegion {
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
}

