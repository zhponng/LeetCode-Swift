/*
 * @lc app=leetcode.cn id=6 lang=swift
 *
 * [6] Z 字形变换
 */

// @lc code=start
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        
        let repeatNum = numRows + max(numRows - 2, 0)
        
        let lineNumPreRepeat = max(numRows - 2, 0) + 1
        
        var resultArr = Array.init(repeating:
             Array.init(repeating:"", count: (s.count % repeatNum) == 0 ? (s.count / repeatNum) * lineNumPreRepeat : ((s.count / repeatNum) + 1) * lineNumPreRepeat),
             count: numRows)
        
        for (index, char) in s.enumerated(){
            if (index % repeatNum) < numRows {
                // 竖直向下
                let x = (index / repeatNum) * (1 + max(numRows - 2, 0))
                let y = index % repeatNum
                resultArr[y][x] = String.init(char)
            }else{
                // z字形斜线上
                let y = numRows - 2 - (index%repeatNum - numRows)
                let x = (index / repeatNum) * (1 + max(numRows - 2, 0)) + index % repeatNum - numRows + 1
                resultArr[y][x] = String.init(char)
            }
        }
        var resultStr = ""
        for substrArr in resultArr{
            resultStr += substrArr.joined()
        }
        return resultStr
    }
}
// @lc code=end

