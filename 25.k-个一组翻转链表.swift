/*
 * @lc app=leetcode.cn id=25 lang=swift
 *
 * [25] K 个一组翻转链表
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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var resultHead: ListNode? = ListNode(0, head)
        var indexHead = resultHead
        var indexTail: ListNode? = nil
        var tempOriginalNodes: [ListNode?] = Array.init(repeating: nil, count: k)
        while true {
            var tempIndexNode = indexHead?.next
            var isExistK = true
            for i in 0 ..< k {
                if tempIndexNode == nil {
                    isExistK = false
                    break
                }
                tempOriginalNodes[i] = tempIndexNode
                tempIndexNode = tempIndexNode?.next
            }
            if !isExistK {
                break
            }
            indexTail = tempOriginalNodes[k-1]?.next
            indexHead?.next = tempOriginalNodes[k-1]
            for i in 0 ..< k-1 {
                var tempNode: ListNode? = tempOriginalNodes[k-1-i]
                tempNode?.next = tempOriginalNodes[k-2-i]
            }
            tempOriginalNodes[0]?.next = indexTail
            indexHead = tempOriginalNodes[0]
        }
        return resultHead?.next
    }
}
// @lc code=end

