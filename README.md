# LinkedList
单链表，增加，插入，删除，删除最后一个，查找，更改，for in遍历

例如：
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

打印：  
list: 1 -> 2 -> 3 -> 11 -> 12 -> 4       
node: 11 -> 12 -> 4   
insert node 20  
list: 1 -> 2 -> 3 -> 11 -> 20 -> 12 -> 4      
removeLast value:Optional(4)  
list: 1 -> 2 -> 3 -> 11 -> 20 -> 12     
remove after node:11 -> 20 -> 12    
remove value:Optional(20)  
list: 1 -> 2 -> 3 -> 11 -> 12      
item:1  
item:2  
item:3  
item:11  
item:12  
list.count:5  
list.node:Optional(11 -> 12 )  
list: 1 -> 2 -> 33 -> 11 -> 12    
