/*
 * @lc app=leetcode.cn id=7 lang=swift
 *
 * [7] 整数反转
 */

// @lc code=start
class Solution {
    func reverse(_ x: Int) -> Int {
        let s:String = String(x)
        var sArr = s.compactMap { char in
            String(char)
        }
        
        let isNegative = sArr.first == "-"
        
        if isNegative{
            sArr[0] = ""
        }
        sArr = sArr.reversed()
        
        var resultStr = sArr.joined()
        
        if Double(resultStr)! > pow(2, 31) - 1 {
            return 0
        }
        
        if isNegative{
            resultStr = "-" + resultStr
        }
        return Int(resultStr)!
    }
}
// @lc code=end

