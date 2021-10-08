/*
 * @lc app=leetcode.cn id=13 lang=swift
 *
 * [13] 罗马数字转整数
 */

// @lc code=start
class Solution {
    func romanToInt(_ s: String) -> Int {
        var result = 0
        let charArr = s.compactMap{ char in
            String(char)
        }
        
        var passChar = false

        for index in 0 ..< s.count {
            if passChar{
                passChar = false
                continue
            }
            let char = charArr[index]
            let nextChar = index >= s.count - 1 ? nil : charArr[index + 1]
            if char == "M" {
                result += 1000
            }else if char == "D" {
                result += 500
            }else if char == "C" {
                if nextChar == "D"{
                    result += 400
                    passChar = true
                }else if nextChar == "M" {
                    result += 900
                    passChar = true
                }else{
                    result += 100
                }
            }else if char == "L" {
                result += 50
            }else if char == "X" {
                if nextChar == "L"{
                    result += 40
                    passChar = true
                }else if nextChar == "C" {
                    result += 90
                    passChar = true
                }else{
                    result += 10
                }
            }else if char == "V" {
                result += 5
            }else if char == "I"{
                if nextChar == "V"{
                    result += 4
                    passChar = true
                }else if nextChar == "X" {
                    result += 9
                    passChar = true
                }else{
                    result += 1
                }
            }
        }
        return result
    }
}
// @lc code=end

