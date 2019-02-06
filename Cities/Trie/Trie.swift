//
//  Trie.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

class Trie<T> {
    typealias Node = TrieNode<Character, T>
    
    fileprivate let root: Node
    fileprivate var wordCount: Int
    
    init() {
        root = Node()
        wordCount = 0
    }
    
    public var words: [T] {
        return wordsInSubtrie(rootNode: root, partialWord: "")
    }
}

extension Trie {
    func insert(word: String, data: T) {
        guard !word.isEmpty else { return }
        
        var currentNode = root
        for character in word.lowercased() {
            if let childNode = currentNode.children[character] {
                currentNode = childNode
            } else {
                currentNode.add(value: character)
                currentNode = currentNode.children[character]!
            }
        }
        
        wordCount += 1
        currentNode.isTerminating = true
        currentNode.data = data
    }
    
    private func findLastNodeOf(word: String) -> Node? {
        var currentNode = root
        for character in word.lowercased() {
            guard let childNode = currentNode.children[character] else {
                return nil
            }
            currentNode = childNode
        }
        return currentNode
    }
    
    fileprivate func wordsInSubtrie(rootNode: Node, partialWord: String) -> [T] {
        var subtrieWords = [T]()
        var previousLetters = partialWord
        
        if let value = rootNode.value {
            previousLetters.append(value)
        }
        
        if rootNode.isTerminating {
            subtrieWords.append(rootNode.data!)
        }
        
        for childNode in rootNode.children.values {
            let childWords = wordsInSubtrie(rootNode: childNode, partialWord: previousLetters)
            subtrieWords += childWords
        }
        
        return subtrieWords
    }
    
    func findWordsWithPrefix(prefix: String) -> [T] {
        var words = [T]()
        let prefixLowerCased = prefix.lowercased()
        if let lastNode = findLastNodeOf(word: prefixLowerCased) {
            if lastNode.isTerminating {
                words.append(lastNode.data!)
            }
            
            for childNode in lastNode.children.values {
                let childWords = wordsInSubtrie(rootNode: childNode, partialWord: prefixLowerCased)
                words += childWords
            }
        }
        return words
    }
}
