//
//  ViewController.swift
//  algorithm-01-白银关
//
//  Created by money on 2023/11/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        createNode1()
//        createNode2()
        createNode3()
    }


}


///刷脂针专题
extension ViewController {
    
}

/// 合并有序链表
extension ViewController {
    
    
    func createNode3() {
        
//        let list1 = ListNode.init(1)
//
//        let list3 = ListNode.init(3)
//        list1.next = list3
//
//        let list4 = ListNode.init(4)
//        list3.next = list4
//
//        let list8 = ListNode.init(8)
//        list4.next = list8
        
        
//        let list2 = ListNode.init(0)
        
//        let list5 = ListNode.init(5)
//        list2.next = list5
//
//        let list6 = ListNode.init(6)
//        list5.next = list6
//
//        let list7 = ListNode.init(7)
//        list6.next = list7
        

//        let new = mergeTwoLists(list1: nil, list2: list2)
        
        

        let list0 = ListNode.init(0)
        
        let list1 = ListNode.init(1)
        list0.next = list1
        
        let list2 = ListNode.init(2)
        list1.next = list2
        
        let list3 = ListNode.init(3)
        list2.next = list3
        
        let list4 = ListNode.init(4)
        list3.next = list4
        
        let list5 = ListNode.init(5)
        list4.next = list5
        
        
        let newlist1 = ListNode.init(1000000)
        
        let newlist2 = ListNode.init(1000001)
        newlist1.next = newlist2
        
        let newlist3 = ListNode.init(1000002)
        newlist2.next = newlist3
        
        
        let newNode = mergeInBetween(list0, 3, 4, newlist1)
        
        //        输入：list1 = [0,1,2,3,4,5], a = 3, b = 4, list2 = [1000000,1000001,1000002]

        
        print("11")
    }
    
    
    ///给你两个链表 list1 和 list2 ，它们包含的元素分别为 n 个和 m 个。
    ///请你将 list1 中下标从 a 到 b 的全部节点都删除，并将list2 接在被删除节点的位置。
    ///这道题的重点从0个下标开始
    ///1.找到list1 b下标的节点 node2, a节点会破坏源于的list1，这里需要有限查找b节点
    ///2.找到list1 a下标之前的节点 node1, node1.next == list2
    ///3.找到list2最后一个节点node3, node3.next = node2.next node2 = nil
    func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        
        guard let _ = list1 else {
            return nil
        }
        
        guard let _ = list2 else {
            return nil
        }
        
        let length  = GetListLength(head: list1)
        
        if length < a || length < b || a < 0 || b < 0 || a >= b {
            return nil
        }
        
        
        
        
        ///找到list1 b下标的节点 node2
        var endNode = list1
        var end = 0
        while endNode?.next != nil, end < b {
            endNode = endNode?.next
            end += 1
        }
        
        
        
        
        
        ///找到list1 a下标之前的节点 node1
        ///方法1 for遍历
        
        var firstNode = list1
        
//        for i in 0..<a-1{
//            firstNode = firstNode?.next
//        }
        
        ///方法2 while循环
        var first = 0
        while firstNode?.next != nil, first < a - 1 {
            firstNode = firstNode?.next
            first += 1
        }
        
        ///node1.next == list2
        firstNode?.next = list2
        
        
        ///找到list2最后一个节点node3
        var node3 = list2
        while node3?.next != nil {
            node3 = node3?.next
        }
        
        ///node3.next = node2.next node2 = nil
        
        node3?.next = endNode?.next
        
        return list1
    }
    
    
    
    
    ///合并两个链表
    ///1.新建一个链表和两个节点
    ///2.两个链表都不是空，取出第一个节点，比较大小，小的在前面，然后取出下一个
    ///这里说下重点：最后要求是一个节点，，得是首节点，而比较需要一直next，，这里创建两个基点，一个是首节点，另一个是next节点
    ///同时首节点和next节点必须初始化，这里是用取巧的方法，新建一个-1的节点，最后返回时next节点，更简单
    ///3.其中一个链表为空，则直接将另一个拼接
    func mergeTwoLists(list1: ListNode?, list2: ListNode?) -> ListNode? {
        
        var newList1: ListNode? = list1
        var newList2: ListNode? = list2
        
        var newHead: ListNode? = ListNode.init(-1)
        
        let head: ListNode? = newHead
        
        while newList1 != nil && newList2 != nil {
            
            if newList1!.val <= newList2!.val {
                newHead?.next = newList1
                newHead = newHead?.next
                newList1 = newList1?.next
            } else {
                newHead?.next = newList2
                newHead = newHead?.next
                newList2 = newList2?.next
            }
        }
        
        newHead?.next = newList1 == nil ? newList2 : newList1
        
        return head?.next
    }
    
    ///合并 K 个升序链表
    ///两个两个合并
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {

        var oneNode: ListNode?
        var twoNode: ListNode?
        
        for (index,node) in lists.enumerated() {
            
            if index == 0 {
                oneNode = node
            } else {
                twoNode = node
                
                oneNode = mergeTwoLists(list1: oneNode, list2: twoNode)
            }
        }
        
        return oneNode
    }
    
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
    
}


///判断链表是否是回文序列

extension ViewController {
    
    func createNode2() {
        
        let headNode = ListNode.init(1)
        
        let node2 = ListNode.init(2)
        headNode.next = node2
        
        let node3 = ListNode.init(3)
        node2.next = node3
        
        let node4 = ListNode.init(2)
        node3.next = node4
        
        let node5 = ListNode.init(1)
        node4.next = node5
        
        let isNew = isPalindrome(head: headNode)
        
        print("")
    }
    
    ///1遍历链表放到数组中
    ///2在遍历一遍和数组的最后一位比较，不同则不是
    ///3.移除最后一位，继续遍历
    func isPalindrome(head: ListNode?) -> Bool {
        
        guard let _ = head else {
            return false
        }
        
        var node: ListNode? = head
        var nodes = [Int]()
        while node != nil {
            nodes.append(node!.val)
            node = node?.next
        }
        
        var node2: ListNode? = head
        while node2 != nil {
            guard let lastInt = nodes.last else {
                return false
            }
            
            if node2?.val != lastInt {
                return false
            }
            
            nodes.removeLast()
            node2 = node2?.next
        }
        
        return true
    }
}

///两个链表的第一个公共节点问题

extension ViewController {
    

    func createNode1() {
        
        let firstNode = ListNode.init(1)
        
        let firstNode2 = ListNode.init(2)
        firstNode.next = firstNode2
        
        let firstNode3 = ListNode.init(3)
        firstNode2.next = firstNode3
        
        
        let secondNode = ListNode.init(10)
        
        
        let secondNode2 = ListNode.init(11)
        secondNode.next = secondNode2
        
        
        let commenNode1 = ListNode.init(4)
        firstNode3.next = commenNode1
        secondNode2.next = commenNode1
        
        
        let commenNode2 = ListNode.init(5)
        commenNode1.next = commenNode2
        
        
        let commenNode3 = ListNode.init(6)
        commenNode2.next = commenNode3
        
//        let node = hashGetCommenNode(headA: firstNode, headB: secondNode)
        
        let node = zhanGetCommenNode(headA: firstNode, headB: secondNode)
        
        print("")
    }
    
    
    ///hash方法
    ///1.将链表1放入数组中
    ///2.遍历链表2查看数组中是否有相通的节点
    func hashGetCommenNode(headA: ListNode, headB: ListNode) -> ListNode? {
        
        var firstNode: ListNode? = headA
        
        var firstArray = [ListNode]()
        
        while firstNode != nil {
            firstArray.append(firstNode!)
            firstNode = firstNode!.next
        }
        
        
        var secondNode: ListNode? = headB
        
        while secondNode != nil {
            
            if firstArray.contains(secondNode!) {
                
                return secondNode
            }
            
            secondNode = secondNode!.next
        }
        
        return nil
    }
    
    ///栈的思想
    ///将两个链表分别放到两个数组中
    ///因为后部分相同，所以数组的最后几位是相同的
    ///同事移除最后一个数据，则最后相同的即为最新的节点
    func zhanGetCommenNode(headA: ListNode, headB: ListNode) -> ListNode? {
        
        var firstNode: ListNode? = headA
        var firstArray = [ListNode]()
        
        while firstNode != nil {
            firstArray.append(firstNode!)
            firstNode = firstNode?.next
        }
        
        
        
        var secondNode: ListNode? = headB
        var secondArray = [ListNode]()
        
        while secondNode != nil {
            secondArray.append(secondNode!)
            secondNode = secondNode?.next
        }
        
        
        var node: ListNode?
        
        while firstArray.count > 0 {
            
            guard let node1 = firstArray.last else {
                return nil
            }
            
            
            guard let node2 = secondArray.last else {
                return nil
            }
            
            
            if node1 == node2 {
                node = node1
            } else {
                break
            }
            
            firstArray.removeLast()
            secondArray.removeLast()
        }
        
        
        return node
    }
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
