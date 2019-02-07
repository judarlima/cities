//
//  City.swift
//  Cities
//
//  Created by Judar Lima on 05/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

struct City {
    let id: Int
    let country: String
    let name: String
    let coord: City.Coordinate
    
    struct Coordinate {
        let lat: Double
        let lon: Double
    }
}

extension City: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case country, name
        case coord
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        country = try values.decode(String.self, forKey: .country)
        name = try values.decode(String.self, forKey: .name)
        coord = try values.decode(City.Coordinate.self, forKey: .coord)
    }
}

extension City.Coordinate: Decodable {
    enum CodingKeys: String, CodingKey {
        case lat, lon
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decode(Double.self, forKey: .lat)
        lon = try values.decode(Double.self, forKey: .lon)
    }
}

extension City: Equatable {
    static func == (lhs: City, rhs: City) -> Bool {
        return lhs.id == rhs.id &&
            lhs.country == rhs.country &&
            lhs.name == rhs.name &&
            lhs.coord.lat == rhs.coord.lat &&
            lhs.coord.lon == rhs.coord.lon
    }
}
