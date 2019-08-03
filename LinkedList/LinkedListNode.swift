//
//  LinkedListNode.swift
//  LinkedList
//
//  Created by Myron on 2019/7/30.
//  Copyright © 2019 Myron. All rights reserved.
//


final class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    
    init(value: T, next: LinkedListNode? = nil) {
        self.value = value
        self.next = next
    }
}

extension LinkedListNode: CustomStringConvertible {
    var description: String {
        guard let next = next else { return "\(value)" }
        return "\(value) -> \(String(describing: next)) "
    }
}
