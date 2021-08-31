/*
 * @lc app=leetcode.cn id=1049 lang=swift
 *
 * [1049] 最后一块石头的重量 II
 */

// @lc code=start
class Solution {
    func lastStoneWeightII(_ stones: [Int]) -> Int {
        if(stones.count == 2){
            return self.lastStoneWeightBetween(stones[0], stones[1])
        }else if(stones.count == 1){
            return stones[0]
        }else if(stones.count == 0){
            return 0
        }else{
            let last = self.lastStoneWeightBetween(stones[0], stones[1])
            var lastArr = stones
            lastArr.remove(at: 0)
            lastArr.remove(at: 1)
            if (last > 0){
                lastArr.append(last)
            }
            return lastStoneWeightII(lastArr)
        }
    }

    func lastStoneWeightBetween(_ stoneWeight1: Int, _ stoneWeight2: Int) -> Int{
        return abs(stoneWeight1 - stoneWeight2)
    }
}

// @lc code=end

