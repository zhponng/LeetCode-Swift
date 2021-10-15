/*
 * @lc app=leetcode.cn id=20 lang=swift
 *
 * [20] 有效的括号
 */

// @lc code=start
class Solution {
    func isValid(_ s: String) -> Bool {
        var result = true
        var charStack = [String]()
        let pairs: [String: String] = [
            ")": "(",
            "]": "[",
            "}": "{"
        ]
        for (_, char) in s.enumerated(){
            let currentChar = String(char)
            if currentChar == "{" || currentChar == "(" || currentChar == "[" {
                charStack.append(currentChar)
            }else{
                if charStack.last == nil || charStack.last != pairs[currentChar] {
                    result = false
                    break
                }else{
                    charStack.popLast()
                }
            }
        }
        return result && charStack.count == 0
    }
}
// @lc code=end

