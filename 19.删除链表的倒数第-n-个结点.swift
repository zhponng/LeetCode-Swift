/*
 * @lc app=leetcode.cn id=19 lang=swift
 *
 * [19] 删除链表的倒数第 N 个结点
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
    // 空间换时间
    // func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    //     var items = [ListNode?]()
    //     var length = 0
    //     var index = head
    //     while index != nil {
    //         items.append(index!)
    //         length += 1
    //         index = index!.next
    //     }
    //     if length == 1 {
    //         return nil
    //     }

    //     let removedIndex = length - n
    //     if (removedIndex == 0){
    //         return items[1]
    //     }else if (removedIndex == length - 1) {
    //         items[removedIndex - 1]!.next = nil
    //     }else{
    //         items[removedIndex - 1]!.next = items[removedIndex + 1]
    //     }
    //     return items[0]
    // }
    
    // 快慢指针
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let tempNode = ListNode.init(0, head)
        var slow: ListNode? = tempNode
        var fast = head
        for index in 0 ..< n {
            fast = fast?.next
        }

        while fast != nil{
            slow = slow?.next
            fast = fast?.next
        }

        slow?.next = slow?.next?.next

        return tempNode.next
    }
}
// @lc code=end

