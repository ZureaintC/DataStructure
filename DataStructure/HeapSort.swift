//
//  HeapSort.swift
//  DataStructure
//
//  Created by 付晨 on 2017/9/15.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 堆排序
class HeapSort{
    static let heapSortShare = HeapSort()
    private init(){}
    
    /// 堆排序
    ///
    /// - Parameter array: 目标数组
    func heapSort(array:inout Array<Int>){
        for i in (0...(array.count - 2)/2).reversed(){
            heapAdjust(array: &array,s: i,m:array.count-1)
            print(array)
        }
        for i in (1..<array.count).reversed(){
            swap(&array[0], &array[i])
            print(i)
            heapAdjust(array: &array,s: 0,m:i-1)
            print(array)
        }
    }
    
    /// 堆调整
    ///
    /// - Parameters:
    ///   - array: 目标数组
    ///   - s: 开始节点
    ///   - m: 结束节点
    private func heapAdjust(array:inout Array<Int>,s:Int,m:Int){
        var temp = array[s]
        var s = s + 1
        var i = 2 * s
        while i-1 <= m{
            if i-1 <= m && i>m{
                i = i - 1
            }else if i-1 <= m && array[i]<array[i-1] {
                i = i - 1
            }
            if temp >= array[i]{
                break
            }
            array[s - 1] = array[i]
            array[i] = temp
            s = i + 1
            i = (i+1) * 2
            //temp = array[s-1]
        }
    }
}
