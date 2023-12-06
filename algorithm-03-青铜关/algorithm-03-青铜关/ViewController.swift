//
//  ViewController.swift
//  algorithm-03-青铜关
//
//  Created by money on 2023/12/5.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController {
    
    
    ///https://leetcode.cn/problems/monotonic-array/
    ///896. 单调数列
    ///如果数组是单调递增或单调递减的，那么它是 单调 的。
    ///如果对于所有 i <= j，nums[i] <= nums[j]，那么数组 nums 是单调递增的。 如果对于所有 i <= j，nums[i]> = nums[j]，那么数组 nums 是单调递减的。
    ///当给定的数组 nums 是单调数组时返回 true，否则返回 false。
    ///
    ///方法1 分别判断递增和递减
//    func isMonotonic(_ nums: [Int]) -> Bool {
//
//        ///判断都是递增
//        var dizeng = true
//
//        for (index, num) in nums.enumerated() {
//
//            if index == nums.count - 1 {
//                continue
//            }
//
//            let num2 = nums[index + 1]
//
//            if num <= num2 {
//
//            } else {
//                dizeng = false
//            }
//        }
//
//        if dizeng {
//            return dizeng
//        }
//
//        ///判断递减
//        var dijian = true
//
//        for (index, num) in nums.enumerated() {
//
//            if index == nums.count - 1 {
//                continue
//            }
//
//            let num2 = nums[index + 1]
//
//            if num >= num2 {
//
//            } else {
//                dijian = false
//            }
//        }
//
//        if dijian {
//            return dijian
//        }
//
//        return false
//    }
//
    ///2.以上两种方法合为一种
    func isMonotonic(_ nums: [Int]) -> Bool {
        
        ///判断都是递增
        var dizeng = true
        
        ///判断递减
        var dijian = true
        
        for (index, num) in nums.enumerated() {
            
            if index == nums.count - 1 {
                continue
            }
            
            let num2 = nums[index + 1]
            
            if num <= num2 {
                
            } else {
                dizeng = false
            }
            
            
            if num >= num2 {
                
            } else {
                dijian = false
            }
        }
        
        return dizeng || dijian
    }
    
    
//    88. 合并两个有序数组
//    给你两个按 非递减顺序 排列的整数数组 nums1 和 nums2，另有两个整数 m 和 n ，分别表示 nums1 和 nums2 中的元素数目。
//    请你 合并 nums2 到 nums1 中，使合并后的数组同样按 非递减顺序 排列。
//    注意：最终，合并后数组不应由函数返回，而是存储在数组 nums1 中。为了应对这种情况，nums1 的初始长度为 m + n，其中前 m 个元素表示应合并的元素，后 n 个元素为 0 ，应忽略。nums2 的长度为 n 。
    
//    此题的突破点在于
//
//    先把数组1中非占位的元素取出作为array1
//    确认while循环结束条件为array1和array2任意一个不为空
//    同时取出array1和array2的首元素，将更小的元素放到最后的容器数组中后再将其从对应的array1或array2中移除
//    如果array1和array2任意一个数组为空后，将另一个数组直接添加到最后的容器数组
    
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        // 如果m为0,说明nums1为空数组
        if m == 0 {
            nums1 = nums2
        }
        // 创建一个数组添加待合并的元素
        var resultArray = [Int]()
        // 创建一个数组排除多余的0
        var newNums1 = Array(nums1[0..<m])
        var newNums2 = nums2
        // 循环结束条件为: newNums1和newNums2都不为空数组
        while !newNums1.isEmpty && !newNums2.isEmpty {
            // 比较两个数组中第一个元素的大小
            if newNums1.first! <= newNums2.first! {
                // 添加到合并数组中
                resultArray.append(newNums1.first!)
                // 移动元素
                newNums1.removeFirst()
            } else {
                resultArray.append(newNums2.first!)
                newNums2.removeFirst()
            }
            // 如果newNums1为空,直接把newNums2的元素添加到合并数组中
            if newNums1.isEmpty {
                resultArray.append(contentsOf: newNums2)
                nums1 = resultArray
            }
            // 如果newNums2为空,直接把newNums1的元素添加到合并数组中
            if newNums2.isEmpty {
                resultArray.append(contentsOf: newNums1)
                nums1 = resultArray
            }
        }
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
