//
//   LinkedList.swift
//  LinkedList
//
//  Created by Myron on 2019/7/30.
//  Copyright © 2019 Myron. All rights reserved.
//

struct LinkedList<T> {
    var head: LinkedListNode<T>?
    var tail: LinkedListNode<T>?
    init() { }
    
    //存储节点的LinkedListNode是Class类型，是一个引用类型，在对元素进行操作之前，先复制一份LinkedListNode
    mutating func copyNodes() {
        //当这个对象有且仅有一个强引用时，就会返回 true
        guard !isKnownUniquelyReferenced(&head) else { return }
        guard var oldNode = head else { return }
        
        head = LinkedListNode(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            let nextNewNode = LinkedListNode(value: nextOldNode.value)
            newNode?.next = nextNewNode
            newNode = nextNewNode
            oldNode = nextOldNode
        }
        
        tail = newNode
    }
}

// MARK: - Getters
extension LinkedList {
    var isEmpty: Bool {
        return head == nil
    }
}

//MARK: - description
extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else { return "Empty list" }
        return String(describing: head)
    }
}

// MARK: - 增加
extension LinkedList {
    mutating func append(_ value: T) {
        copyNodes()
        
        guard !isEmpty else {
            let node = LinkedListNode(value: value)
            head = node
            tail = node
            return
        }
        let next = LinkedListNode(value: value)
        tail?.next = next
        tail = next
    }
    
    //MARK: 增加一个节点
    mutating func append(_ node: LinkedListNode<T>) {
        copyNodes()
        
        guard !isEmpty else {
            head = node
            tail = node
            return
        }
        tail?.next = node
        tail = node
    }
    
    mutating func insert(_ value: T, after node: LinkedListNode<T>) {
        copyNodes()
        guard tail !== node else { append(value); return }
        node.next = LinkedListNode(value: value, next: node.next)
    }
}

// MARK: - 删除
extension LinkedList {
    mutating func removeLast() -> T? {
        copyNodes()
        
        guard let head = head else { return nil }
        
        guard head.next != nil else {
            let headValue = head.value
            self.head = nil
            tail = nil
            return headValue
        }
        
        var prev = head
        var current = head
        while let next = current.next {
            prev = current
            current = next
        }
        prev.next = nil
        tail = prev
        return current.value
    }
    
    mutating func remove(after node: LinkedListNode<T>) -> T? {
        copyNodes()
        
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        
        return node.next?.value
    }
}

// MARK: - 查找
extension LinkedList {
    func node(at index: Int) -> LinkedListNode<T>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
}

// MARK: - 改
extension LinkedList {
    func update(after index:Int,node:LinkedListNode<T>){
        guard let oldNode = self.node(at: index) else {
            return
        }
        
        let nextNode = oldNode.next
        oldNode.next = node
        node.next = nextNode?.next
        
        return
    }
}

// MARK: - Collection
extension LinkedList: Collection {
    
    struct Index: Comparable {
        var node: LinkedListNode<T>?

        static func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }

        static func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else { return false }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
    
    var startIndex: Index {
        return Index(node: head)
    }

    var endIndex: Index {
        return Index(node: tail?.next)
    }

    func index(after i: Index) -> Index {
        return Index(node: i.node?.next)
    }
    
    subscript(index: Index) -> T {
        return index.node!.value
    }
}
