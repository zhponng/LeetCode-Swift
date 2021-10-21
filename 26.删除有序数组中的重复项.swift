/*
 * @lc app=leetcode.cn id=26 lang=swift
 *
 * [26] 删除有序数组中的重复项
 */

// @lc code=start
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var singleIndex = -1;

        for index in 0 ..< nums.count {
            let currentNum = nums[index]
            if singleIndex == -1 {
                singleIndex += 1
                continue
            }
            if (!nums[0 ... singleIndex].contains(currentNum)){
                nums[singleIndex + 1] = currentNum
                singleIndex += 1
            } 
        }
        return singleIndex + 1
    }
}
// @lc code=end

