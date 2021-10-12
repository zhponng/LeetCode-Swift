/*
 * @lc app=leetcode.cn id=16 lang=swift
 *
 * [16] 最接近的三数之和
 */

// @lc code=start
class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let numsSorted = nums.sorted()
        // print("排序后结果:\(numsSorted)")
        // var resultArr = [[Int]]()
        var resultSum:Int? = nil
        
        for (index, num) in numsSorted.enumerated() {
            if resultSum != nil && (abs(num - target) > abs(resultSum! - target)) && num > target && num > 0{
                break
            }
            if (index > 0 && numsSorted[index] == numsSorted[index-1]){
                continue
            }
            var leftIndex = index + 1
            var rightIndex = numsSorted.count - 1
            while true{
                if leftIndex >= numsSorted.count || leftIndex >= rightIndex || rightIndex < 0{
                    break
                }
                let leftNum = numsSorted[leftIndex]
                let rightNum = numsSorted[rightIndex]
                let sum = num + leftNum + rightNum
                // print("当前数:\(num), 左数:\(leftNum), 右数:\(rightNum), 和:\(sum)")
                if resultSum != nil && abs(sum - target) >= abs(resultSum! - target) && (sum - target) > 0 {
                    // print("差值小于结果，且和大于0，右坐标左移")
                    rightIndex -= 1
                }else if resultSum != nil && abs(sum - target) >= abs(resultSum! - target) && (sum - target) < 0{
                    // print("差值小于结果，且和大于0，左坐标右移")
                    leftIndex += 1
                }else{
                    // 符合条件
                    if resultSum != nil {
                        
                        if (sum - target) < 0 {
                            while leftIndex < rightIndex && numsSorted[leftIndex] == numsSorted[leftIndex+1] {
                                leftIndex += 1
                            }
                        }else if (sum - target) > 0 {
                            while leftIndex < rightIndex && numsSorted[rightIndex] == numsSorted[rightIndex-1] {
                                rightIndex -= 1
                            }
                        }else{
                            resultSum = sum
                            break
                        }
                        
                    }
                    
                    resultSum = sum
                }
            }
        }
        return resultSum ?? 0
    }
}
// @lc code=end

