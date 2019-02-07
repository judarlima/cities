//
//  Coordinate.swift
//  Cities
//
//  Created by Judar Lima on 05/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

struct Coordinate {
    let lat: Double
    let lon: Double
}

extension Coordinate: Decodable {
    enum CodingKeys: String, CodingKey {
        case lat, lon
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decode(Double.self, forKey: .lat)
        lon = try values.decode(Double.self, forKey: .lon)
    }
}
