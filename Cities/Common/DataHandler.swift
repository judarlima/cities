//
//  DataHandler.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

protocol DataHandler {
    func loadData(completion: @escaping (Result<Data>) -> Void)
}

final class JsonDataHandler: DataHandler {
    private let fileName = "cities"
    
    func loadData(completion: @escaping (Result<Data>) -> Void) {
        guard
            let filePath = Bundle.main.path(forResource: fileName, ofType: "json")
            else {
                completion(.failure(.fileNotFound))
                return
        }
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath),
                                    options: .mappedIfSafe)
            completion(.success(jsonData))
        } catch {
            completion(.failure(.unexpected))
        }
        
    }
}

