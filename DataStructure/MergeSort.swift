//
//  MergeSort.swift
//  DataStructure
//
//  Created by 付晨 on 2017/9/15.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 归并排序
class MergeSort{
    static let mergeSortShare = MergeSort()
    private init(){}
    
    /// 归并排序 迭代版
    ///
    /// - Parameter array: 目标数组
    func mergeSort(array:inout Array<Int>){
        var tempArray:Array<Array<Int>> = []
        for a in array{
            var subArray:Array<Int> = []
            subArray.append(a)
            tempArray.append(subArray)
        }
        while tempArray.count != 1 {
            var i = 0
            while i < tempArray.count - 1{
                tempArray[i] = mergeArray(firstList: tempArray[i], secondList: tempArray[i + 1])
                tempArray.remove(at: i+1)
                i = i + 1 //若不自增1 类似于选择排序
            }
        }
        array = tempArray[0]
    }
    
    /// 合并数组
    ///
    /// - Parameters:
    ///   - firstList: 先数组
    ///   - secondList: 后数组
    /// - Returns: 合并结果
    func mergeArray(firstList:Array<Int>,secondList:Array<Int>) -> Array<Int>{
        var result :Array<Int> = []
        var firstIndex = 0
        var secondIndex = 0
        while firstIndex < firstList.count && secondIndex < secondList.count {
            if firstList[firstIndex] < secondList[secondIndex]{
                result.append(firstList[firstIndex])
                firstIndex += 1
            }else{
                result.append(secondList[secondIndex])
                secondIndex += 1
            }
        }
        while firstIndex < firstList.count {
            result.append(firstList[firstIndex])
            firstIndex += 1
        }
        while secondIndex < secondList.count {
            result.append(secondList[secondIndex])
            secondIndex += 1
        }
        return result
    }
}
