/*
 * @lc app=leetcode.cn id=7 lang=swift
 *
 * [7] 整数反转
 */

// @lc code=start
class Solution {
    func reverse(_ x: Int) -> Int {
        // 解法2: 转字符串并倒叙
        // let s:String = String(x)
        // var sArr = s.compactMap { char in
        //     String(char)
        // }
        
        // let isNegative = sArr.first == "-"
        
        // if isNegative{
        //     sArr[0] = ""
        // }
        // sArr = sArr.reversed()
        
        // var resultStr = sArr.joined()
        
        // if Double(resultStr)! > pow(2, 31) - 1 {
        //     return 0
        // }
        
        // if isNegative{
        //     resultStr = "-" + resultStr
        // }
        // return Int(resultStr)!

        // 解法2：循环取余数
        var result = 0
        var num = x
        while num != 0 {
            result = result * 10 + num % 10
            num = num/10
        }
        if result < Int32.min || result > Int32.max {
            return 0
        }
        return result
    }
}
// @lc code=end

