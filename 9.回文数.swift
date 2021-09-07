/*
 * @lc app=leetcode.cn id=9 lang=swift
 *
 * [9] 回文数
 */

// @lc code=start
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0{
            return false
        }

        var reversedNum = 0
        var num = x
        while num != 0 {
            reversedNum = reversedNum * 10 + num % 10
            num = num / 10
        }

        return reversedNum == x
    }
}
// @lc code=end

