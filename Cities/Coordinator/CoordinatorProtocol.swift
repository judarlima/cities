//
//  Coordinator.swift
//  Cities
//
//  Created by Judar Lima on 05/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
