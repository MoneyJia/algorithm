//
//  ViewController.swift
//  algorithm-02-白银关
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
        
        let a = reverseBetween(node1, 2, 4)
        
        let a1 = reverseBetween(node5, 1, 1)

        
        print("")
    }
    
    
    ////92 反转链表II
    ///https://leetcode.cn/problems/reverse-linked-list-ii/description/
    ///给你单链表的头指针 head 和两个整数 left 和 right ，其中 left <= right 。
    ///请你反转从位置 left 到位置 right 的链表节点，返回 反转后的链表 。
    /// 思路：
    /// 1.取出left前部分节点
    ///    新建一个初始化为0的节点leftNode 最后返回leftNode.next，可变节点newNode
    ///    前部分遍历时修改newNode，将newnode变为left之前的节点
    /// 2.中间反转
    ///        新的链表 centerNode， left = count 时保存反转后的最后一个节点 newNode2
    ///        centerNode反转后的链表 left == right 时，newnode.next是centerNode newNode2.next = 剩余
    ///3.最后返回leftNode.next
//    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
//
//        ///初始化节点 0
//        let leftNode: ListNode? = ListNode.init(0)
//
//        ///新的链表的next节点 - 一直变
//        var newNode = leftNode
//
//
//        ///中间部分
//        var centerNode: ListNode?
//
//
//        var newNode2: ListNode?
//
//
//        var newHead = head
//
//        var count = 1
//
//        while newHead != nil {
//
//            ///取出下一个节点
//            let nextNode = newHead?.next
//
//            if count < left {
//
//                ///还不到left  拼接到 leftNode
//                newHead?.next = nil
//                newNode?.next = newHead
//                newNode = newNode?.next
//            }   else {
//
//                ///中间是需要反转的
//                newHead?.next = centerNode
//                centerNode = newHead
//
//
//                if  count == right {
//
//
//                    ///最后一个反转的节点，就是leftnode的next节点
//                    newNode?.next = centerNode
//
//                    ///剩余部分
//                    newNode2?.next = nextNode
//
//                    break
//                } else if count == left {
//
//                    ///保存节点，反转后的最后一个节点
//                    newNode2 = newHead
//
//                }
//            }
//
//            count += 1
//            newHead = nextNode
//        }
//
//        return leftNode?.next
//    }
    
    
    
    
    ///思路二
    ///1.新建一个链表
    ///2循环前left-1个
    /// 保存最后一个节点node
    ///3.循环left到right个
    ///   每次都是newNode.next = node.next
    ///       node.next = newNode.next
    ///       当最后一个时，将剩下的部分拼接上
    ///
//    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
//
//        let leftNode = ListNode.init(0)
//
//        var node1: ListNode?
//
//        var newNode: ListNode? = head
//
//        for _ in 1..<left {
//
//            let next = newNode?.next
//
//            newNode?.next = nil
//            leftNode.next = newNode
//
//            node1 = newNode
//
//            newNode = next
//        }
//
//        var node2: ListNode?
//
//
//        for index in left...right {
//
//            let next = newNode?.next
//
//            newNode?.next = node1?.next
//            node1?.next = newNode
//
//            if left == index {
//                node2 = newNode
//
//                if leftNode.next == nil {
//                    leftNode.next = newNode
//                }
//            }
//
//            newNode = next
//
//            if right == index {
//
//                node2?.next = next
//            }
//        }
//
//        return leftNode.next
//    }
    
    ///1 新建前置节点dummyNode，并将next指向head
    ///2 遍历到left-1个节点，保存left-1个节点 pre,, 这是反转后的头节点
    ///3 遍历left到right-1个节点
    ///     每次都是移动两个节点所以是right - left - 1个节点
    ///     保存pre后的节点 cur
    ///     遍历时，取出 cur下面的节点 next，，这样就有两个节点 cur 和next，
    ///     这里需要将cur.next = next.next  next.next = cur  pre.next = next 以上三步主要是交换 2 3 ，并保持链表正确
    ///     这里循环的是节点cur， cur.next = next.next 使得每次 cur.next 都是需要变动的节点，pre就是头节点，这样循环就能持续下去
    
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        
        ///0 1 2 3 4 5
        let dummyNode = ListNode.init(0)
        dummyNode.next = head
        
        ///pre  0 1 2 3 4 5
        var pre: ListNode? = dummyNode
        
        for _ in 0..<(left - 1) {
            pre = pre?.next
        }
        
        ///pre 1 2 3 4 5
        
        /// cur 2 3 4 5
        let cur = pre?.next
        
        /// nil
        var next: ListNode?
        
        for _ in 0..<(right - left) {
            
            ///第一轮  next 3 4 5
            ///第二轮  cur变成了 2 4 5  这里 next是 4 5
            next = cur?.next
            
            ///第一轮 2的next 是 4 5   cur 变成了 2 4 5
            ///第二轮 4的next 是5  cur 变成了 2 5
            cur?.next = next?.next
            
            ///第一轮 3的next 变成了 1后面的2
            ///第二轮 4的next变成了1后面的 3
            next?.next = pre?.next
            
            ///第一轮 1的next 变成了 3。这里就是 1 3 2 4 5
            ///第二轮 1的next 变成了 4。这里就是 1 4 3 2 5
            pre?.next = next
        }
        
        return dummyNode.next
    }
    
    
    
    
    ///24. 两两交换链表中的节点
    ///给你一个链表，两两交换其中相邻的节点，并返回交换后链表的头节点。你必须在不修改节点内部的值的情况下完成本题（即，只能进行节点交换）。
    ///思路：
    ///1.先增加一个头节点
    ///2.一次遍历两个,如下所示
    ///-1              1            2
    ///newHead next1   next2
    ///3.每次交换 next1和next2
    
    func swapPairs(_ head: ListNode?) -> ListNode? {

        let dummyNode = ListNode.init(-1)
        dummyNode.next = head
        
        var newHead: ListNode? = dummyNode
        
        while newHead?.next != nil, newHead?.next?.next != nil {
            
            let next1 = newHead?.next
            let next2 = newHead?.next?.next

            next1?.next = next2?.next
            next2?.next = next1
            newHead?.next = next2
            
            newHead = next1
        }
        
        return dummyNode.next
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
