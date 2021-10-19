/*
 * @lc app=leetcode.cn id=22 lang=swift
 *
 * [22] 括号生成
 */

// @lc code=start
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        if n == 0 {
            return [""]
        }else if n == 1 {
            return ["()"]
        }
        var resultArr = [String]()
        for index in 0 ..< n {
            for left in self.generateParenthesis(index){
                for right in self.generateParenthesis(n - index - 1){
                    resultArr.append("(\(left))\(right)")
                }
            }
        }
        return resultArr
    }
}
// @lc code=end

