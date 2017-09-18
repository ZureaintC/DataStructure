//
//  SimpleSelectionSort.swift
//  DataStructure
//
//  Created by 付晨 on 2017/9/14.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 简单选择排序
class SimpleSelectionSort{
    static let simpleSelectionSort = SimpleSelectionSort()
    private init(){}
    
    /// 简单选择排序
    /// 将最小的直接选择出来放到适合的地方，最多交换array.count-1次
    /// - Parameter array: <#array description#>
    func selectSort(array:inout Array<Int>){
        var min:Int
        for i in 0..<array.count{
            min = i
            for j in i+1 ..< array.count{
                if array[min] > array[j]{
                    min = j
                }
            }
            if i != min {
                swap(&array[i], &array[min])
            }
        }
    }
}
