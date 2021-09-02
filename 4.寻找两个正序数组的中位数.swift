/*
 * @lc app=leetcode.cn id=4 lang=swift
 *
 * [4] 寻找两个正序数组的中位数
 */

// @lc code=start
class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var combinedNums = [Int]()

        if nums1.count == 0 && nums2.count == 0{
            return 0.0
        }
        
        let endIndex = (nums1.count + nums2.count) / 2
        var nums1Index = nums1.count > 0 ? 0 : -1
        var nums2Index = nums2.count > 0 ? 0 : -1
        for index in 0...endIndex {
            let tempNum1 = nums1Index == -1 ? nil : nums1[nums1Index]
            let tempNum2 = nums2Index == -1 ? nil : nums2[nums2Index]

            if (tempNum1 == nil){
                combinedNums.append(tempNum2!)
                nums2Index = nums2Index + 1 >= nums2.count ? -1 : nums2Index + 1
            }else if (tempNum2 == nil){
                combinedNums.append(tempNum1!)
                nums1Index = nums1Index + 1 >= nums1.count ? -1 : nums1Index + 1
            }else{
                if (tempNum1! < tempNum2!){
                    combinedNums.append(tempNum1!)
                    nums1Index = nums1Index + 1 >= nums1.count ? -1 : nums1Index + 1
                }else{
                    combinedNums.append(tempNum2!)
                    nums2Index = nums2Index + 1 >= nums2.count ? -1 : nums2Index + 1
                }
            }
        }
        
        
        if (nums1.count + nums2.count) % 2 == 0 {
            return Double((combinedNums[endIndex] + combinedNums[endIndex - 1]))/2.0
        }else{
            return Double(combinedNums[endIndex])
        }
    }
}
// @lc code=end

