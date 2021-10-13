/*
 * @lc app=leetcode.cn id=17 lang=swift
 *
 * [17] 电话号码的字母组合
 */

// @lc code=start
class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        let charsMap = [
            "2": "abc",
            "3": "def",
            "4": "ghi",
            "5": "jkl",
            "6": "mno",
            "7": "pqrs",
            "8": "tuv",
            "9": "wxyz",
        ]

        var results = [String]()
        var chars = [String]()
        for (_, numChar) in digits.enumerated() {
            chars.append(charsMap[String(numChar)]!)
        }

        for (index, charStr) in chars.enumerated() {
            if (index == 0){
                for (_, item) in charStr.enumerated(){
                    results.append(String(item))
                }
            }else{
                var tempPrefixs = [String]()
                for (_, item) in charStr.enumerated(){
                    for (_, strPrefix) in results.enumerated(){
                        tempPrefixs.append("\(strPrefix)\(item)")
                    }
                }
                results = tempPrefixs
            }
        }
        return results
    }
}
// @lc code=end

