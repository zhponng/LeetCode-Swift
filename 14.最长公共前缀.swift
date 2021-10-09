/*
 * @lc app=leetcode.cn id=14 lang=swift
 *
 * [14] 最长公共前缀
 */

// @lc code=start
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var result = ""

        let maxLength = strs[0].count // 由于题目中描述strs长度最少为1，所以直接取第一个元素长度为最大索引值

        for index in 0 ..< maxLength{
            var lastPrefix = ""
            var samePrefix = true
            for item in strs {
                if index >= item.count {
                    samePrefix = false
                    break
                }
                let currentPrefix = item[item.startIndex ... item.index(item.startIndex, offsetBy: index)]
                if lastPrefix == "" {
                    lastPrefix = String(currentPrefix)
                }else{
                    if lastPrefix != currentPrefix {
                        samePrefix = false
                        break
                    }
                }
            }
            if !samePrefix {
                break
            }else{
                result = lastPrefix
            }
        }
        return result
    }
}
// @lc code=end

