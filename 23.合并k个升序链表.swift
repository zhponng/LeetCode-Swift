/*
 * @lc app=leetcode.cn id=23 lang=swift
 *
 * [23] 合并K个升序链表
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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var indexs = [ListNode?]()
        var head = ListNode(0, nil)
        var resultIndex:ListNode? = head

        for indexNode in lists {
            indexs.append(indexNode)
        }

        while true {
            var minNode:ListNode? = nil
            var minIndex:Int? = nil

            for (index, indexNode) in indexs.enumerated() {
                if minNode == nil && indexNode != nil {
                    minNode = indexNode
                    minIndex = index
                }else if (indexNode == nil){
                    continue
                }else{
                    if minNode!.val > indexNode!.val{
                        minNode = indexNode
                        minIndex = index
                    }
                }
            }

            if minNode != nil {
                resultIndex?.next = minNode
                resultIndex = resultIndex?.next
                indexs[minIndex!] = indexs[minIndex!]?.next
            }else{
                break
            }
        }
        return head.next
    }
}
// @lc code=end

