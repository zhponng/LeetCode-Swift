/*
 * @lc app=leetcode.cn id=3 lang=swift
 *
 * [3] 无重复字符的最长子串
 */

// @lc code=start
class Solution {
     func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLength = 0
        var strStartIndex = 0
        var charDict = Dictionary<Character, Int>() // 存放字符对应的index

        for (index, char) in s.enumerated(){
            let previousIndex = charDict[char] ?? -1
            if previousIndex < strStartIndex {
                // 没有重复，重新计算最大长度
                charDict[char] = index
                maxLength = max(maxLength, index - strStartIndex + 1)

            }else{
                // 重复字母，重置start索引到重复的位置的下一个
                strStartIndex = previousIndex + 1
                charDict[char] = index
            }
        }
        return maxLength
    }
}
// @lc code=end

