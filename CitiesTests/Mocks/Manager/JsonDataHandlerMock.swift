//
//  JsonDataHandlerMock.swift
//  CitiesTests
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation
@testable import Cities

class JsonDataHandlerMock: DataHandler {
    private let fileName = "testCities"
    var hasToFail = false
    
    func loadData(completion: @escaping (Result<Data>) -> Void) {
        if hasToFail {
            completion(.failure(.fileNotFound))
        } else {
            completion(.success(generateData()))
        }
    }
    
    private func generateData() -> Data {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: "json")
            else { fatalError("Could not mock data!") }
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath),
                                    options: .mappedIfSafe)
            return jsonData
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
