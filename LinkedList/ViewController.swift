//
//  ViewController.swift
//  LinkedList
//
//  Created by Myron on 2019/7/30.
//  Copyright © 2019 Myron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)
        let node = LinkedListNode(value: 11)
        let node2 = LinkedListNode(value: 12)
        list.append(node)
        list.append(node2)
        list.append(4)
        
        print("list: \(list)")
        print("node: \(node)")
        
        print("insert node 20")
        list.insert(20, after: node)
        print("list: \(list)")
        
        let value = list.removeLast()
        print("removeLast value:\(value)")
        print("list: \(list)")
        
        print("remove after node:\(node)")
        let value2 = list.remove(after: node)
        print("remove value:\(value2)")

        print("list: \(list)")

        for item in list {
            print("item:\(item)")
        }
        
        print("list.count:\(list.count)")

        print("list.node:\(list.node(at: 3))")
        
        list.update(after: 1, node: LinkedListNode(value: 33))
        print("list: \(list)")

        
    }


}

