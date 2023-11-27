//
//  ViewController.swift
//  algorithm-01
//
//  Created by money on 2023/11/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        Practice1()
        AddNode()
        DeleteNode()
    }
    
    
    ///模拟链表的长度
    func Practice1() {
        
        let head = CreateNode()
        let count = GetListLength(head: head)
        
        print("这个节点的长度是\(count)")
    }
    
    
    ///链表的增加
    func AddNode() {
        
        let head1 = CreateNode()
        let insertNode1 = ListNode(data: 11)
        let newHead1 = InsertNode(head: head1, insertNode: insertNode1, position: 1)
        
        let head2 = CreateNode()
        let insertNode2 = ListNode(data: 11)
        let newHead2 = InsertNode(head: head2, insertNode: insertNode2, position: 11)
        
        
        let head3 = CreateNode()
        let insertNode3 = ListNode(data: 11)
        let newHead3 = InsertNode(head: head3, insertNode: insertNode3, position: 5)
        
        print("head")
    }
    
    func DeleteNode() {
        
        let head1 = CreateNode()
        let newHead1 = deleteNode(head: head1, position: 1)
        
        let head2 = CreateNode()
        let newHead2 = deleteNode(head: head2, position: 10)

        
        let head3 = CreateNode()
        let newHead3 = deleteNode(head: head3, position: 5)

        print("head")
    }
    
    func CreateNode() -> ListNode? {
        
        var head: ListNode?
        
        for index in 0..<10 {
            
            let realIndex = 10-index
            
            if let strongHead = head {
                let topNode = ListNode(data: realIndex)
                topNode.next = strongHead
                head = topNode
            } else {
                head = ListNode(data: realIndex)
            }
        }
        
        return head
    }
    
}


extension ViewController {
    
    ///1.遍历链表
    func GetListLength(head: ListNode?) -> Int {
        
        guard let strongHead = head else {
            print("这个节点为空")
            return 0
        }
        
        var length = 1
        
        var newHead = strongHead
        
        while newHead.next != nil {
            length += 1
            newHead = newHead.next!
        }
        
        return length
    }
    
    ///2.链表的插入
    func InsertNode(head: ListNode?, insertNode: ListNode?, position: Int) -> ListNode? {
        
        guard let strongInsertNode = insertNode else {
            print("插入数据异常")
            return head
        }
        
        guard let _ = head else {
            print("原有节点为空")
            return insertNode
        }
        
        let length = GetListLength(head: head)
        
        ///最小为1（插入第1个），最大为length+1（变为最后一个）
        if position <= 0 || position > length + 1 {
            print("插入位置异常")
            return head
        }
        
        if position == 1 {
            
            ///插入到第1个节点
            ///第一个节点只需要考虑插入节点的next为head即可
            strongInsertNode.next = head
            return strongInsertNode
        }
        
        ///中间插入 最后一个和中间相同
        
        ///先找到第position-1个节点
        var nextNode = head
        var count = 1
        while count < position - 1 {
            ///这里 +1和判断条件的位置需要重点考虑
            count += 1
            nextNode = nextNode?.next
        }
        
        
        ///插入 中加
        ///需要考虑前后两个节点
        insertNode?.next = nextNode?.next
        nextNode?.next = insertNode
        
        return head
    }
    
    ///3.链表的删除
    func deleteNode(head: ListNode?, position: Int) -> ListNode? {
        
        guard let strongHead = head else {
            print("原有节点为空")
            return head
        }
        
        let length = GetListLength(head: head)
        
        ///最小为1（插入第1个），最大为length（变为最后一个）
        if position <= 0 || position > length {
            print("插入位置异常")
            return head
        }
        
        if position == 1 {
            ///第一个数据 直接返回next节点就可以了
            return strongHead.next
        }
        
        ///中间和最后一个都是相通的思路
        ///先找到前一个节点
        ///再将前一个节点的next指向当前节点的下一个节点
        var newHead = head
        var count = 1
        
        ///先取出position前一个节点
        while count < position - 1 {
            count += 1
            newHead = newHead?.next
        }
        
        ///删除就是position前一个节点的next指向position下一个节点
        newHead?.next = newHead?.next?.next
        return head
        
    }
}


class ListNode: NSObject {
    
    init(data: Int) {
        self.data = data
    }
    
    var data = 0
    var next: ListNode?
    
}
