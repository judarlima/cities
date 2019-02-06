//
//  CityViewModel.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

struct CityViewModel {
    let name: String
    let lat: String
    let lon: String
    
    init(city: City) {
        self.name = city.name + ", " + city.country
        self.lat = String(city.coord.lat)
        self.lon = String(city.coord.lon)
    }
}
