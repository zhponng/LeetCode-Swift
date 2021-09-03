/*
 * @lc app=leetcode.cn id=5 lang=swift
 *
 * [5] 最长回文子串
 */

// @lc code=start
class Solution {
    // 动态规划
    // func longestPalindrome(_ s: String) -> String {

    //     if s.count == 0 || s.count == 1 {
    //         return s
    //     }

    //     var palindrome = String.init(s.first!)

    //     var resultArr = Array.init(repeating: Array.init(repeating: false, count: s.count), count: s.count)

    //     // 单个字母都是回文序列
    //     for index in 0 ..< s.count{
    //         resultArr[index][index] = true
    //     }

    //     var charStrArr = [String]()
    //     s.forEach { char in
    //         charStrArr.append(String.init(char))
    //     }
        
    //     for length in 2 ... s.count{
    //         for startIndexNum in 0 ... s.count - length {
    //             let endIndexNum = startIndexNum + length - 1

    //             let substr = charStrArr[startIndexNum ... endIndexNum].joined()

    //             let startChar = substr.first
    //             let endChar = substr.last
    //             // 根据resultArr缓存的结果，以及首位字母是否相同，来判断当前串是否是回文
    //             if (startChar != endChar){
    //                 resultArr[startIndexNum][endIndexNum] = false
    //             }else if (endIndexNum - startIndexNum < 2 || resultArr[startIndexNum + 1][endIndexNum - 1]){
    //                 // 是回文
    //                 resultArr[startIndexNum][endIndexNum] = true
    //                 if substr.count > palindrome.count{
    //                     palindrome = substr
    //                 }
    //             }else {
    //                 resultArr[startIndexNum][endIndexNum] = false
    //             }
    //         }
    //     }

    //     return palindrome
    // }
    
    // 中心扩展
    func longestPalindrome(_ s: String) -> String {

        if s.count == 0 || s.count == 1 {
            return s
        }

        var palindrome = ""

        // swift中，s.index方法耗时比较严重，所以转化成数组
        var charStrArr = [String]()
        s.forEach { char in
            charStrArr.append(String.init(char))
        }

        for index in 0 ..< s.count{
            let substr1 = self.expandAroundCenter(withCharStrArr: charStrArr, leftIndexNum: index, rightIndeNum: index)
            let substr2 = self.expandAroundCenter(withCharStrArr: charStrArr, leftIndexNum: index, rightIndeNum: index+1)

            if substr1.count > palindrome.count{
                palindrome = substr1
            }
            if substr2.count > palindrome.count{
                palindrome = substr2
            }
        }

        return palindrome
    }
}

extension Solution{
    func expandAroundCenter(withCharStrArr s:[String], leftIndexNum:Int, rightIndeNum: Int) -> String{
        var tempLeftIndex = leftIndexNum
        var tempRightIndex = rightIndeNum
        
        while tempLeftIndex >= 0 && tempRightIndex < s.count{

            let leftChar = s[tempLeftIndex]
            let rightChar = s[tempRightIndex]
            
            if leftChar != rightChar{
                break
            }else{
                tempLeftIndex -= 1
                tempRightIndex += 1
            }
        }
        
        var resultStr = ""
        if tempRightIndex - tempLeftIndex > 1 {
            let leftIndex = tempLeftIndex+1
            let rightIndex = tempRightIndex-1
            
            resultStr = s[leftIndex ... rightIndex].joined()
        }else if tempRightIndex == tempLeftIndex{
            let leftIndex = tempLeftIndex
            let rightIndex = tempRightIndex
            
            resultStr = s[leftIndex ... rightIndex].joined()
        }
        return resultStr
    }
}

// @lc code=end

