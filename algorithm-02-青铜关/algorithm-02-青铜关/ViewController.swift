//
//  ViewController.swift
//  algorithm-02-青铜关
//
//  Created by money on 2023/11/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createNode1()
    }
    
}

extension ViewController {
    
    func createNode1() {
        
        let node1 = ListNode.init(1)
        
        let node2 = ListNode.init(2)
        node1.next = node2
        
        let node3 = ListNode.init(3)
        node2.next = node3
        
        let node4 = ListNode.init(4)
        node3.next = node4
        
        let node5 = ListNode.init(5)
        node4.next = node5
        
        let a = reverseList(node1)
        
        print("")
    }
    
    ///206 反转链表
    ///给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。
    ///不需要表头
    ///每次遍历一个都放入一个新的链表中
    ///1.这个重点是将当前节点的下一个节点取出来
    ///2.当前节点作为头节点插入链表中
    ///3.将下一个节点作为头节点，继续循环
//    func reverseList(_ head: ListNode?) -> ListNode? {
//
//        var newNode = head
//
//        var newHead: ListNode?
//
//        while newNode != nil {
//
//            let node2 = newNode?.next
//
//            if newHead == nil {
//                newNode?.next = nil
//                newHead = newNode
//            } else {
//                newNode?.next = newHead
//                newHead = newNode
//            }
//
//            newNode = node2
//        }
//
//        return newHead
//    }
    
    ///206 反转链表
    ///给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。
    ///不需要表头
    ///每次遍历一个都放入一个新的链表中
    ///1.这个重点是将当前节点的下一个节点取出来
    ///2.当前节点作为头节点插入链表中
    ///3.将下一个节点作为头节点，继续循环
    func reverseList(_ head: ListNode?) -> ListNode? {

        var newNode = head

        var newHead: ListNode?

        while newNode != nil {

            let node2 = newNode?.next

            newNode?.next = newHead
            newHead = newNode

            newNode = node2
        }

        return newHead
    }
    
//    func reverseList(_ head: ListNode?) -> ListNode? {
//
//        var node1 = head
//
//        var newHead = ListNode.init(0)
//
//        while node1 != nil {
//
//            let next = node1?.next
//
//            node1?.next = newHead.next
//            newHead.next = node1
//
//            node1 = next
//        }
//
//        return newHead.next
//    }
}




class ListNode: NSObject {
    
    var val = 0
    var next: ListNode?
    
    override init() {
        self.val = 0;
        self.next = nil;
    }
    
    public init(_ val: Int) {
        self.val = val;
        self.next = nil;
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val;
        self.next = next;
    }
}


