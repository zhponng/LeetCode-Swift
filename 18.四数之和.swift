/*
 * @lc app=leetcode.cn id=18 lang=swift
 *
 * [18] 四数之和
 */

// @lc code=start
class Solution {
    // 三重循环哈希法
//    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
//        // 长度 不足，不做处理
//       if nums.count  < 4 {
//           return []
//       }
//       var numsSorted = nums
//       numsSorted.sort()
//        // 三重循环哈希法
//       // 创建一个三维的相加结果表，以相加结果为key，坐标组成的数组为value
//       var sum3D = [Int: [[Int]]]()
//       for index1 in 0 ..< numsSorted.count {
//           for index2 in index1+1 ..< numsSorted.count {
//               for index3 in index2+1 ..< numsSorted.count {
//                    let sum = numsSorted[index1] + numsSorted[index2] + numsSorted[index3]
//                    if sum3D.keys.contains(sum) {
//                        // 已经存在该和值的情况下，更新坐标
//                        var indexArr = sum3D[sum]
//                        indexArr!.append([index1, index2, index3])
//                        sum3D[sum] = indexArr!
//                    //     var indexArr = sum3D[sum]
//                    //     var isContained = false
//                    //     for indexs in indexArr! {
//                    //     let num1 = numsSorted[indexs[0]]
//                    //     let num2 = numsSorted[indexs[1]]
//                    //     let num3 = numsSorted[indexs[2]]
//                    //     let currentNum1 = numsSorted[index1]
//                    //     let currentNum2 = numsSorted[index2]
//                    //     if num1 == currentNum1 && num2 == currentNum2 {
//                    //         isContained = true
//                    //         break
//                    //     }
//                    //     }
//                    // if !isContained {
//                    //    indexArr!.append([index1, index2])
//                    //    sum2D[sum] = indexArr
//                    // }
//                    }else{
//                        // 不存在该值的情况下，新建该键值对
//                        sum3D[sum] = [[index1, index2, index3]]
//                    }
//               }
//           }
//       }
//       // 遍历数组，寻找满足条件的结果
//       var resultArr = [[Int]]()
//       for (index, num) in numsSorted.enumerated() {
//           let diffIndexs = sum3D[target-num]
//           if diffIndexs == nil{
//               continue
//           }
//           for indexs in diffIndexs! {
//               // 去除相同坐标
//               if indexs[0] == index || indexs[1] == index || indexs[2] == index{
//                   continue
//               }
//                // 去除坐标不同，但值相同的
//                let currentArr = [num, numsSorted[indexs[0]], numsSorted[indexs[1]], numsSorted[indexs[2]]]
//               let sortedCurrentArr = currentArr.sorted()
//                var isContained = false
//                for nums in resultArr {
//                    let sortedNums = nums.sorted()
//                    if sortedNums[0] == sortedCurrentArr[0] && sortedNums[1] == sortedCurrentArr[1] && sortedNums[2] == sortedCurrentArr[2] && sortedNums[3] == sortedCurrentArr[3]{
//                        isContained = true
//                        break
//                    }
//                }
//                // 满足条件
//                if !isContained {
//                   resultArr.append([num, numsSorted[indexs[0]], numsSorted[indexs[1]], numsSorted[indexs[2]]])
//                }
//           }
//       }
//       return resultArr
//    }
    // 双指针法
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let sortedNums = nums.sorted()
        
        var resultArr = [[Int]]()
        
        for (index1, num1) in sortedNums.enumerated(){
            if (index1 > 0 && sortedNums[index1] == sortedNums[index1-1]){
                continue
            }
            for (index2, num2) in sortedNums.enumerated(){
                if index2 <= index1 {
                    continue
                }
                if (index2 > index1+1 && sortedNums[index2] == sortedNums[index2-1]){
                    continue
                }
                var leftIndex = index2 + 1
                var rightIndex = sortedNums.count - 1
                while true{
                    if (leftIndex >= rightIndex || leftIndex >= sortedNums.count || rightIndex <= index2){
                        break
                    }
                    let leftNum = sortedNums[leftIndex]
                    let rightNum = sortedNums[rightIndex]
                    let currentSum = num1 + num2 + leftNum + rightNum
                    if currentSum == target {
                        resultArr.append([num1, num2, leftNum, rightNum])
                        
                        while (leftIndex < sortedNums.count-1 && sortedNums[leftIndex+1] == sortedNums[leftIndex]){
                            leftIndex += 1
                        }
                        leftIndex += 1
                        
                        while (rightIndex > index2+1 && sortedNums[rightIndex-1] == sortedNums[rightIndex]){
                            rightIndex -= 1
                        }
                        rightIndex -= 1
                    }else if(currentSum > target){
                        while (rightIndex > index2+1 && sortedNums[rightIndex-1] == sortedNums[rightIndex]){
                            rightIndex -= 1
                        }
                        rightIndex -= 1
                    }else{
                        while (leftIndex < sortedNums.count-1 && sortedNums[leftIndex+1] == sortedNums[leftIndex]){
                            leftIndex += 1
                        }
                        leftIndex += 1
                    }
                }
                
            }
        }
        
        return resultArr
    }
}
// @lc code=end

