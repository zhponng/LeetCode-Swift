/*
 * @lc app=leetcode.cn id=21 lang=swift
 *
 * [21] 合并两个有序链表
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var index1 = l1
        var index2 = l2

        var resultIndex:ListNode? = ListNode(0, nil)
        var head:ListNode? = resultIndex
        while (index1 != nil || index2 != nil){
            if index1 == nil {
                resultIndex?.next = index2
                index2 = index2?.next
            }else if index2 == nil {
                resultIndex?.next = index1
                index1 = index1?.next
            }else{
                if index1!.val <= index2!.val {
                    resultIndex?.next = index1
                    index1 = index1!.next
                }else{
                    resultIndex?.next = index2
                    index2 = index2!.next
                }
            }
            resultIndex = resultIndex?.next
        }
        return head?.next
    }
}
// @lc code=end

