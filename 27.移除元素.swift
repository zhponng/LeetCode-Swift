/*
 * @lc app=leetcode.cn id=27 lang=swift
 *
 * [27] 移除元素
 */

// @lc code=start
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var singleIndex = -1;

        for index in 0 ..< nums.count {
            let currentNum = nums[index]
            if (currentNum != val){
                nums[singleIndex + 1] = currentNum
                singleIndex += 1
            } 
        }
        return singleIndex + 1
    }
}
// @lc code=end

