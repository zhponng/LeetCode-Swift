/*
 * @lc app=leetcode.cn id=8 lang=swift
 *
 * [8] 字符串转换整数 (atoi)
 */

// @lc code=start
import Foundation

class Solution {
    func myAtoi(_ s: String) -> Int {
        var resultStr = ""
        var isNegative = false
        var resultNum = 0
        
        var isGetNum = false
        for (_, char) in s.enumerated(){
            let charStr = String(char)
            if charStr == " " {
                if isGetNum {
                    break
                }else{
                    continue
                }
            }
            if charStr == "-" && !isGetNum{
                isGetNum = true
                isNegative = true
                resultStr += charStr
            }else if (charStr == "+" && !isGetNum){
                isGetNum = true
                resultStr += charStr
                continue
            }else if(self.isNumber(charStr)){
                isGetNum = true
                resultStr += charStr
                resultNum = resultNum * 10 + Int(charStr)!
                
                let tempNum = isNegative ? resultNum * -1 : resultNum
                if tempNum < Int32.min{
                    return Int(Int32.min)
                }else if tempNum > Int32.max{
                    return Int(Int32.max)
                }
            }else{
                break
            }
        }
        return isNegative ? resultNum * -1 : resultNum
    }
    
    func isNumber(_ s:String) -> Bool{
        let regex = "^[0-9]{1}$"
        do{
            let RE = try NSRegularExpression(pattern: regex, options: .caseInsensitive)
            let matchs = RE.matches(in: s, options: .reportProgress, range: NSRange(location: 0, length: s.count))
            return matchs.count > 0
        }catch{
            return false
        }
    }
}
// @lc code=end

