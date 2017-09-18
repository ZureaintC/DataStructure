//
//  ShellSort.swift
//  DataStructure
//
//  Created by 付晨 on 2017/9/15.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 希尔排序
class ShellSort{
    static let shellSortShare = ShellSort()
    private init(){}
    
    /// 希尔排序
    /// 增量为 increment／3+1 可根据array更改
    /// - Parameter array: <#array description#>
    func shellSort(array:inout Array<Int>){
        var increment = array.count
        var temp = 0
        repeat{
            increment = increment / 3 + 1
            for i in increment..<array.count{
                temp = array[i]
                var j = i - increment
                while j > -1 && temp<array[j] {
                    array[j+increment] = array[j]
                    j-=increment
                }
                array[j+increment] = temp
            }
            print(array)
        }while increment > 1
    }
}
