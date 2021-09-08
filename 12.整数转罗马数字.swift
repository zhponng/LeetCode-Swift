/*
 * @lc app=leetcode.cn id=12 lang=swift
 *
 * [12] 整数转罗马数字
 */

// @lc code=start
class Solution {
    func intToRoman(_ num: Int) -> String {
        var result = ""
        var remainingNum = num

        let MCount = num / 1000
        remainingNum -= MCount * 1000

        // M数量
        if MCount > 0{
            for _ in 0 ..< MCount {
                result += "M"
            }
        }
        // 求D数量和C数量
        let hundredCount = remainingNum / 100
        remainingNum -= hundredCount * 100
        if hundredCount >= 5{
            if hundredCount == 9{
                result += "CM"
            }else{
                result += "D"
                let CCount = hundredCount % 5
                for _ in 0 ..< CCount {
                    result += "C"
                }
            }
        }else if hundredCount == 4{
            result += "CD"
        }else if hundredCount  > 0{
            for _ in 0 ..< hundredCount {
                result += "C"
            }
        }

        // 求L数量和X数量
        let tenCount = remainingNum / 10
        remainingNum -= tenCount * 10
        if tenCount >= 5{
            if tenCount == 9 {
                result += "XC"
            }else{
                result += "L"
                let XCount = tenCount % 5
                for _ in 0 ..< XCount {
                    result += "X"
                }
            }
        }else if tenCount == 4{
            result += "XL"
        }else if tenCount > 0{
            for _ in 0 ..< tenCount {
                result += "X"
            }
        }

        // 求V和I数量
        if (remainingNum >= 5){
            if remainingNum == 9 {
                result += "IX"
            }else{
                result += "V"
                let ICount = remainingNum % 5
                for _ in 0 ..< ICount {
                    result += "I"
                }
            }
        }else if remainingNum == 4{
            result += "IV"
        }else if remainingNum > 0{
            for _ in 0 ..< remainingNum {
                result += "I"
            }
        }
        return result
    }
}
// @lc code=end

