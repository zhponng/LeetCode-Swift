/*
 * @lc app=leetcode.cn id=2 lang=swift
 *
 * [2] 两数相加
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

       var resultNode: ListNode = ListNode()

        var l1Pointer = l1
        var l2Pointer = l2
        var resultPointer = resultNode
        var carry = 0 // 进位

        while l1Pointer != nil || l2Pointer != nil {
            let numberSum:Int = (l1Pointer?.val ?? 0) + (l2Pointer?.val ?? 0) + carry
            resultPointer.val = numberSum % 10
            carry = numberSum / 10

            l1Pointer = l1Pointer?.next ?? nil
            l2Pointer = l2Pointer?.next ?? nil
            
            if (l1Pointer != nil || l2Pointer != nil){
                resultPointer.next = ListNode()
                resultPointer = resultPointer.next!
            }
            
        }

        if carry != 0{
            resultPointer.next = ListNode.init(carry)
        }

        return resultNode
    }
}
// @lc code=end

