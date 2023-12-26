//
//  ViewController.swift
//  algorithm-03-白银关
//
//  Created by money on 2023/12/6.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var arr1: [Int] = [1,1,2]
        
        let a = self.removeDuplicates2(&arr1)
        
        print("11")
        
        
        var arr2: [Int]  = [3,1,2,4]
        let b = self.sortArrayByParity(arr2)
        
        print("22")
    }
    
    
}

extension ViewController {
    
//    27. 移除元素
//    给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。
//
//    不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。
//
//    元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。
    
    ///方法1: 快慢法
    ///1.fast先走，当fast 和 slow不等时，slow移动
    ///2.每次都是slow增加，所以修改nums[slow]中的值就可以了
    ///3.最后返回slow
//    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
//
//        if nums.count == 0 {
//            return 0
//        }
//
//        var slow: Int = 0
//
//        for (fast, num) in nums.enumerated() {
//
//            if num != val {
//                nums[slow] = nums[fast]
//                slow += 1
//            }
//        }
//
//        return slow
//    }
    
    ///方法2：对撞双指针
    ///1. left 和 right分别从左右往中间移动
    ///2.以left判断值是否相同
    /// 相同，，则等待right的不同的，将fast值填充到slow中
    ///3.最后left和right相同就表示走完全程
    ///4.遍历时要判断left <= right 就表示走完全程
    ///
    /// 输入：nums = [3,2,2,3], val = 3
    ///输出：2, nums = [2,2]
    ///
    ///输入：nums = [0,1,4,0,3,0,2,2], val = 2
    ///输出：5, nums = [0,1,3,0,4]
    ///
    ///[3,2,2,3]
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        if nums.count == 0 {
            return 0
        }
        
        var retIdx = 0 ///初始值 0
        var lastIdx = nums.count - 1 ///初始值 3
        
        ///第1轮 0 < 3
        ///第2轮 0 < 2
        ///第3轮 0 < 1
        ///第4轮 1 = 1
        while retIdx <= lastIdx {
            ///第1轮  3 == 3
            ///第2轮  3 == 3
            ///第3轮  0  != 3
            ///第4轮  2  != 3
            if nums[retIdx] == val {
                ///第1轮  变为[ 3 2 2 3] retIdx=0  lastIdx=2
                ///第2轮  变为[ 2 2 2 3] retIdx=0 lastIdx=1
                nums[retIdx] = nums[lastIdx]
                lastIdx -= 1
            } else {
                ///第3轮  变为[ 2 2 2 3] retIdx=2 lastIdx=1
                retIdx += 1
            }
        }
        
        ///最终变为[ 2 2 2 3] retIdx=2 lastIdx=1
        ///最后 不相等的时候才会+1，最后一个不相等，就会+1，相等lastIdx-1，所以最终答案就是retIdx
        return retIdx
    }
    
    
    
    
    /// https://leetcode.cn/problems/remove-duplicates-from-sorted-array/description/
    /// 26. 删除有序数组中的重复项
    ///给你一个 非严格递增排列 的数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。元素的 相对顺序 应该保持 一致 。然后返回 nums 中唯一元素的个数。
    ///考虑 nums 的唯一元素的数量为 k ，你需要做以下事情确保你的题解可以被通过：
    ///更改数组 nums ，使 nums 的前 k 个元素包含唯一元素，并按照它们最初在 nums 中出现的顺序排列。nums 的其余元素与 nums 的大小不重要。返回 k 。
    ///
    ///1.使用快慢指针处理
    ///2.定义当前slow为0
    ///3.for循环从fast=0开始
    ///4.当fast对象的值和
    func removeDuplicates(_ nums: inout [Int]) -> Int {

        if nums.count == 0 {
            return 0
        }
        
        var slow = 1
        
        for (fast, num) in nums.enumerated() {
            
            if num == nums[slow - 1] {
                
            } else {
                nums[slow] = nums[fast]
                slow += 1
            }
        }
        
        return slow
    }
    
//    从前往后遍历数组nums，nums从0开始填入不同的元素
//    设定一个指针len，len=0;len表示目前已填入不同元素的下标位置，len+1表示下一个不同元素要填入的下标位置
//    遍历数组nums,下标i从1开始遍历，如果nums[len] != nums[i],则len++，nums[len] = nums[i];
//    最终nums填入不同元素的个数为len+1；
    func removeDuplicates2(_ nums: inout [Int]) -> Int {
        
        if nums.count <= 0 {return 0}
        
        var len = 0
        for i in 1..<nums.count {
            if nums[len] != nums[i] {
                len += 1
                nums[len] = nums[i]
            }
        }
        
        return len + 1
    }
    
    
//    905. 按奇偶排序数组
//    给你一个整数数组 nums，将 nums 中的的所有偶数元素移动到数组的前面，后跟所有奇数元素。
//
//    返回满足此条件的 任一数组 作为答案。
//
//
//
//    示例 1：
//
//    输入：nums = [3,1,2,4]
//    输出：[2,4,3,1]
//    解释：[4,2,3,1]、[2,4,1,3] 和 [4,2,1,3] 也会被视作正确答案。
//    示例 2：
//
//    输入：nums = [0]
//    输出：[0]
//
//
//    提示：
//
//    1 <= nums.length <= 5000
//    0 <= nums[i] <= 5000
    
    
    ///思路：
    ///1.left right
    ///2.left不是偶数时等待
    ///3.right不是奇数等待
    ///4.替换
    ///5.left+1 = right 或者 left==right时停止
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        
        var left = 0
        var right = nums.count - 1
        
        var newNums = nums
        
        while left < right {
            
            let leftNum = newNums[left]
            let rightNum = newNums[right]
            
            if leftNum % 2 != 0 && rightNum % 2 == 0 {
             
                newNums[left] = rightNum
                newNums[right] = leftNum
                
                left += 1
                right -= 1
            }
            
            if leftNum % 2 == 0 {
                left += 1
            }
            
            if rightNum % 2 != 0 {
                right -= 1
            }
        }
        
        return newNums
    }
}

extension ViewController {
    
//    189. 轮转数组
//
//    提示
//    给定一个整数数组 nums，将数组中的元素向右轮转 k 个位置，其中 k 是非负数。
//
//    示例 1:
//
//    输入: nums = [1,2,3,4,5,6,7], k = 3
//    输出: [5,6,7,1,2,3,4]
//    解释:
//    向右轮转 1 步: [7,1,2,3,4,5,6]
//    向右轮转 2 步: [6,7,1,2,3,4,5]
//    向右轮转 3 步: [5,6,7,1,2,3,4]
//    示例 2:
//
//    输入：nums = [-1,-100,3,99], k = 2
//    输出：[3,99,-1,-100]
//    解释:
//    向右轮转 1 步: [99,-1,-100,3]
//    向右轮转 2 步: [3,99,-1,-100]
//
//
//    提示：
//
//    1 <= nums.length <= 105
//    -231 <= nums[i] <= 231 - 1
//    0 <= k <= 105
    
    ///方法1 分割为2个在拼接
    func rotate(_ nums: inout [Int], _ k: Int) {
        
        var newNums1 = [Int]()
        var newNums2 = [Int]()
        
        let a = nums.count - 1 - k
        
        for (index, num) in nums.enumerated() {
            
            if index <= a {
                newNums1.append(num)
            } else {
                newNums2.append(num)
            }
        }
        
        nums = newNums2 + newNums1
    }
    
    ///方法2 
    func rotate2(_ nums: inout [Int], _ k: Int) {
        
        var newNums1 = [Int]()
        var newNums2 = [Int]()
        
        let a = nums.count - 1 - k
        
        for (index, num) in nums.enumerated() {
            
            if index <= a {
                newNums1.append(num)
            } else {
                newNums2.append(num)
            }
        }
        
        nums = newNums2 + newNums1
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
