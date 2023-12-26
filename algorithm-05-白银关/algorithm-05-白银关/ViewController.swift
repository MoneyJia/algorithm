//
//  ViewController.swift
//  algorithm-05-白银关
//
//  Created by money on 2023/12/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


extension ViewController {
    
//    1. 两数之和
//    给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。
//
//    你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。
//
//    你可以按任意顺序返回答案。
//
//
//
//    示例 1：
//
//    输入：nums = [2,7,11,15], target = 9
//    输出：[0,1]
//    解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。
//    示例 2：
//
//    输入：nums = [3,2,4], target = 6
//    输出：[1,2]
//    示例 3：
//
//    输入：nums = [3,3], target = 6
//    输出：[0,1]
    
    ///思路：双层遍历能解决问题，现在思路有没有更简单的方法
    ///使用集合map的方法
    ///将数组中的值作为key，数组中的位置作为value
    ///和为target，则另一个为target-num[i] , 当map中有值时则返回
    ///没有时，将 num[i]为key，i为value，保存到map中
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var map = [Int: Int]()
        
        for (index, num) in nums.enumerated() {
            
            let other_num = target - num
            if let a = map[other_num] {
                return [a, index]
            }
            
            map[num] = index
        }
        
        return []
    }
}



//    232. 用栈实现队列
//    https://leetcode.cn/problems/implement-queue-using-stacks/description/
//    请你仅使用两个栈实现先入先出队列。队列应当支持一般队列支持的所有操作（push、pop、peek、empty）：
//
//    实现 MyQueue 类：
//
//    void push(int x) 将元素 x 推到队列的末尾
//    int pop() 从队列的开头移除并返回元素
//    int peek() 返回队列开头的元素
//    boolean empty() 如果队列为空，返回 true ；否则，返回 false
//    说明：
//
//    你 只能 使用标准的栈操作 —— 也就是只有 push to top, peek/pop from top, size, 和 is empty 操作是合法的。
//    你所使用的语言也许不支持栈。你可以使用 list 或者 deque（双端队列）来模拟一个栈，只要是标准的栈操作即可。
//
//
//    示例 1：
//
//    输入：
//    ["MyQueue", "push", "push", "peek", "pop", "empty"]
//    [[], [1], [2], [], [], []]
//    输出：
//    [null, null, null, 1, 1, false]
//
//    解释：
//    MyQueue myQueue = new MyQueue();
//    myQueue.push(1); // queue is: [1]
//    myQueue.push(2); // queue is: [1, 2] (leftmost is front of the queue)
//    myQueue.peek(); // return 1
//    myQueue.pop(); // return 1, queue is [2]
//    myQueue.empty(); // return false

///使用两个栈来处理
///栈1 输出数据，栈2存储数据
///每当栈1为空时，就将栈2中的数据从最后一个插入到栈1中
///当栈1 栈2都为空时就是空
class MyQueue {

    var zhan1 = [Int]()
    var zhan2 = [Int]()
    
    init() {

    }
    
    func push(_ x: Int) {
        
        zhan2.append(x)
    }
    
    func pop() -> Int {

        if empty() {
            return 0
        }
        
        self.insertDataFromZhan2ToZhan1()
        
        if zhan1.count > 0 {
            
            let last = zhan1.last!
            zhan1.removeLast()
            return last
        }
        
        return 0
    }
    
    func peek() -> Int {

        if empty() {
            return 0
        }
        
        self.insertDataFromZhan2ToZhan1()
        
        if zhan1.count > 0 {
            
            let last = zhan1.last!
            return last
        }
        
        return 0
    }
    
    func empty() -> Bool {

        if zhan1.isEmpty , zhan2.isEmpty {
            return true
        }
        
        return false
    }
    
    ///插入数据
    func insertDataFromZhan2ToZhan1() {
        
        if zhan1.isEmpty == false {
            return
        }
        
        if zhan2.isEmpty == true {
            return
        }
        
        while zhan2.isEmpty == false {
            
            let last = zhan2.last!
            zhan2.removeLast()
            zhan1.append(last)
        }
    }
}

//225. 用队列实现栈
//
//请你仅使用两个队列实现一个后入先出（LIFO）的栈，并支持普通栈的全部四种操作（push、top、pop 和 empty）。
//
//实现 MyStack 类：
//
//void push(int x) 将元素 x 压入栈顶。
//int pop() 移除并返回栈顶元素。
//int top() 返回栈顶元素。
//boolean empty() 如果栈是空的，返回 true ；否则，返回 false 。
//
//
//注意：
//
//你只能使用队列的基本操作 —— 也就是 push to back、peek/pop from front、size 和 is empty 这些操作。
//你所使用的语言也许不支持队列。 你可以使用 list （列表）或者 deque（双端队列）来模拟一个队列 , 只要是标准的队列操作即可。
//
//
//示例：
//
//输入：
//["MyStack", "push", "push", "top", "pop", "empty"]
//[[], [1], [2], [], [], []]
//输出：
//[null, null, null, 2, 2, false]
//
//解释：
//MyStack myStack = new MyStack();
//myStack.push(1);
//myStack.push(2);
//myStack.top(); // 返回 2
//myStack.pop(); // 返回 2
//myStack.empty(); // 返回 False

///用两个队列来实现一个栈：重点是实现其中一个队列最新插入的数据在最前面
///队列1用于输出  队列2用于插入
///当有新数据时插入队列2中，再将队列1中的数据从0插入队列2中，最后将队列1 队列2互换
///通过以上操作 队列1中最新插入的就在最下头，队列2中没有数据，，其他的就简单了
class MyStack {
    
    var queque1 = [Int]()
    var queque2 = [Int]()
    
    init() {
        
    }
    
    func push(_ x: Int) {
        
        queque2.append(x)
        
        while queque1.isEmpty == false {
            let first = queque1.first!
            queque1.removeFirst()
            queque2.append(first)
        }
        
        let newQueQue = queque1
        
        queque1 = queque2
        queque2 = newQueQue
    }
    
    func pop() -> Int {
        
        if empty() {
            return 0
        }
        
        let first = queque1.first!
        queque1.removeFirst()
        return first
    }
    
    func top() -> Int {
        
        if empty() {
            return 0
        }
        
        return queque1.first!
    }
    
    func empty() -> Bool {
        
        queque1.isEmpty
    }
}
