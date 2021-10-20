/*
 * @lc app=leetcode.cn id=24 lang=swift
 *
 * [24] 两两交换链表中的节点
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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var headTemp = ListNode(0, head)
        var headIndexNode:ListNode? = headTemp
        var indexNode1:ListNode? = headIndexNode?.next
        var indexNode2:ListNode? = indexNode1?.next
        while true {
            if (indexNode1 == nil || indexNode2 == nil) {
                break
            }
            // 第三个node
            var tempNode:ListNode? = indexNode2?.next

            // 交换1、2个node
            headIndexNode?.next = indexNode2
            indexNode2?.next = indexNode1
            indexNode1?.next = tempNode

            // 前进两个
            headIndexNode = indexNode1
            indexNode1 = headIndexNode?.next
            indexNode2 = indexNode1?.next
        }
        return headTemp.next
    }
}
// @lc code=end

