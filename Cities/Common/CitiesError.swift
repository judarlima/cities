//
//  CitiesError.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

enum CitiesError: Error {
    case fileNotFound
    case couldNotParseObject
    case unexpected
    
    var localizedDescription: String {
        switch self {
        case .fileNotFound: return "File not found."
        case .couldNotParseObject: return "Could not parse object."
        case .unexpected: return "Unexpected Error."
        }
    }
}
