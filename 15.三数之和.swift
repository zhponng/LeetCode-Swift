/*
 * @lc app=leetcode.cn id=15 lang=swift
 *
 * [15] 三数之和
 */

// @lc code=start
class Solution {
    // 哈希法，但是超时
//    func threeSum(_ nums: [Int]) -> [[Int]] {
//        // 长度不足，不做处理
//        if nums.count  < 3 {
//            return []
//        }
//        var numsSorted = nums
//        numsSorted.sort()
//        // 创建一个二维的相加结果表，以相加结果为key，坐标组成的数组为value
//        var sum2D = [Int: [[Int]]]()
//        for index1 in 0 ..< numsSorted.count {
//            for index2 in index1 ..< numsSorted.count {
//                // 排除自己与自己相加的情况
//                if index1 == index2{
//                    continue
//                }
//                let sum = numsSorted[index1] + numsSorted[index2]
//                if sum2D.keys.contains(sum) {
//                    // 已经存在该和值的情况下，去重并更新坐标
//                    var indexArr = sum2D[sum]
//                    var isContained = false
//                    for indexs in indexArr! {
//                        let num1 = numsSorted[indexs[0]]
//                        let num2 = numsSorted[indexs[1]]
//                        let currentNum1 = numsSorted[index1]
//                        let currentNum2 = numsSorted[index2]
//                        if num1 == currentNum1 && num2 == currentNum2 {
//                            isContained = true
//                            break
//                        }
//                    }
//                    if !isContained {
//                        indexArr!.append([index1, index2])
//                        sum2D[sum] = indexArr
//                    }
//                }else{
//                    // 不存在该值的情况下，新建该键值对
//                    sum2D[sum] = [[index1, index2]]
//                }
//            }
//        }
//        // 遍历数组，寻找满足条件的结果
//        var resultArr = [[Int]]()
//        for (index, num) in numsSorted.enumerated() {
//            let diffIndexs = sum2D[0-num]
//            if diffIndexs == nil{
//                continue
//            }
//            for indexs in diffIndexs! {
//                // 去除相同坐标
//                if indexs[0] == index || indexs[1] == index {
//                    continue
//                }
//                // 去除坐标不同，但值相同的
//                let currentArr = [num, numsSorted[indexs[0]], numsSorted[indexs[1]]]
//                let currentMax = currentArr.max()
//                let currentMin = currentArr.min()
//                var isContained = false
//                for nums in resultArr {
//                    let max = nums.max()
//                    let min = nums.min()
//                    // 只需要比较最大最小值是否相同，即可比较是否重复
//                    if max == currentMax && min == currentMin {
//                        isContained = true
//                    }
//                }
//                // 满足条件
//                if !isContained {
//                    resultArr.append([num, numsSorted[indexs[0]], numsSorted[indexs[1]]])
//                }
//            }
//        }
//        return resultArr
//    }
    
    // 双指针法
    func threeSum(_ nums: [Int]) -> [[Int]] {
        // 长度不足，不做处理
        if nums.count  < 3 {
            return []
        }
        var numsSorted = nums.sorted()
        var resultArr = [[Int]]()
        for (index, num) in numsSorted.enumerated() {
            if (num > 0){
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
                if sum > 0 {
                    rightIndex -= 1
                }else if sum < 0{
                    leftIndex += 1
                }else{
                    // 符合条件，去重
                    resultArr.append([num, leftNum, rightNum])
                    while leftIndex < rightIndex && numsSorted[leftIndex] == numsSorted[leftIndex+1] {
                        leftIndex += 1
                    }

                    while leftIndex < rightIndex && numsSorted[rightIndex] == numsSorted[rightIndex-1] {
                        rightIndex -= 1
                    }
                    leftIndex += 1
                    rightIndex -= 1
                }
            }
        }
        return resultArr
    }
}
// @lc code=end

