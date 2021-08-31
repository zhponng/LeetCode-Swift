/*
 * @lc app=leetcode.cn id=1 lang=swift
 *
 * [1] 两数之和
 */

// @lc code=start
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // 解法一: 双重循环
        // var resultArr:[Int] = []
        // for (index, firstNumber) in nums.enumerated(){
        //     for index_2 in index+1 ..< nums.count{
        //         var secondNumber = nums[index_2]
        //         if firstNumber + secondNumber == target{
        //             resultArr = [index, index_2]
        //             break
        //         }
        //     }
        //     if resultArr.count > 0{
        //         break
        //     }
        // }
        // return resultArr

        // 解法二: 利用字典的hashmap
        var resultArr:[Int] = []
        var hashmap = [Int: Int]()

        for (index, number) in nums.enumerated(){
            var differenceNumber = target - number
            if let differenceNumberIndex = hashmap[differenceNumber]{
                resultArr = [differenceNumberIndex, index]
                break
            }else{
                hashmap[number] = index
            }
        }
        return resultArr
    }
}
// @lc code=end

