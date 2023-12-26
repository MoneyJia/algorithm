//
//  ViewController.swift
//  algorithm-04-青铜关
//
//  Created by money on 2023/12/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        conect()
    }
    
    
    func conect() {
        
        
        isValid("{[}")
        
    }
    
    
}

extension ViewController {
    
    //20. 有效的括号
    //
    //给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。
    //
    //有效字符串需满足：
    //
    //左括号必须用相同类型的右括号闭合。
    //左括号必须以正确的顺序闭合。
    //每个右括号都有一个对应的相同类型的左括号。
    
    ///这个题很简单，使用栈的思想
    ///1.新建数组 当为'('，'{'，'['时加入数组
    ///2.当为')'，'}'，']'时取出数组最后一个比较，对称则下一个，不对称就是false
    ///3.当字符串长度为0时为true，当为1时为false
    func isValid(_ s: String) -> Bool {
        
        if s.isEmpty {
            return true
        }
        
        if s.count%2 == 1 {
            return false
        }
        
        var arrray = [String]()
        
        for item in s {
            
            let newItem = String(item)
            
            if newItem == "(" || newItem == "{" || newItem == "[" {
                
                arrray.append(newItem)
                
            } else if newItem == ")"{
                
                if let last = arrray.last, last == "(" {
                    arrray.removeLast()
                } else {
                    return false
                }
            } else if newItem == "}"{
                
                if let last = arrray.last, last == "{" {
                    arrray.removeLast()
                } else {
                    return false
                }
            } else if newItem == "]"{
                
                if let last = arrray.last, last == "[" {
                    arrray.removeLast()
                } else {
                    return false
                }
            }
        }
        
        return arrray.count <= 0
        
    }
    
    
}


//    155. 最小栈
//
//    设计一个支持 push ，pop ，top 操作，并能在常数时间内检索到最小元素的栈。
//
//    实现 MinStack 类:
//
//    MinStack() 初始化堆栈对象。
//    void push(int val) 将元素val推入堆栈。
//    void pop() 删除堆栈顶部的元素。
//    int top() 获取堆栈顶部的元素。
//    int getMin() 获取堆栈中的最小元素。
//
//
//    示例 1:
//
//    输入：
//    ["MinStack","push","push","push","getMin","pop","top","getMin"]
//    [[],[-2],[0],[-3],[],[],[],[]]
//
//    输出：
//    [null,null,null,null,-3,null,0,-2]
//
//    解释：
//    MinStack minStack = new MinStack();
//    minStack.push(-2);
//    minStack.push(0);
//    minStack.push(-3);
//    minStack.getMin();   --> 返回 -3.
//    minStack.pop();
//    minStack.top();      --> 返回 0.
//    minStack.getMin();   --> 返回 -2.

class MinStack {
    
    var array = [Int]()
    
    init() {
        
    }
    
    func push(_ val: Int) {
        
        array.append(val)
    }
    
    func pop() {
        
        array.removeLast()
    }
    
    func top() -> Int {
        
        return array.last ?? 0
    }
    
    func getMin() -> Int {
        
        var number = 0
        
        for num in array {
            
            if num < number {
                number = num
            }
        }
        
        return number
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
