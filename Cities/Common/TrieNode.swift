//
//  TrieNode.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

final class TrieNode<T: Hashable, U> {
    weak var parentNode: TrieNode?
    
    var value: T?
    var data: U?
    var children: [T: TrieNode] = [:]
    var isTerminating = false
    
    init(value: T? = nil, parentNode: TrieNode? = nil) {
        self.value = value
        self.parentNode = parentNode
    }
    
    func add(value: T) {
        guard children[value] == nil else {
            return
        }
        children[value] = TrieNode(value: value, parentNode: self)
    }
}
