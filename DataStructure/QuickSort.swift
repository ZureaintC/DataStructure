//
//  QuickSort.swift
//  DataStructure
//
//  Created by 付晨 on 2017/9/18.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 快速排序
class QuickSort{
    static let quickSortShare = QuickSort()
    private init(){}
    
    /// 快速排序 递归版
    ///
    /// - Parameter array: 目标数组
    func quickSort(array:inout Array<Int>){
        qSort(array: &array, low: 0, high: array.count - 1)
    }
    
    /// 快速排序递归方法
    ///
    /// - Parameters:
    ///   - array: 目标数字
    ///   - low: 低指针
    ///   - high: 高指针
    func qSort(array:inout Array<Int>,low:Int,high:Int){
        //var pivot;
        
        if (low<high){
            let pivot = partition(array:&array,low:low,high: high)
            qSort(array: &array, low: low , high: pivot - 1)
            qSort(array: &array, low: pivot + 1, high: high)
        }
    }
    
    /// 快速排序地排序方法
    ///
    /// - Parameters:
    ///   - array: 目标数组
    ///   - low: 低指针
    ///   - high: 高指针
    /// - Returns: 中间指针
    func partition(array: inout Array<Int>,low:Int,high:Int) -> Int{
        let pivotKey = array[low]
        var low = low
        var high = high
        while (low < high) {
            while (low < high && array[high] > pivotKey) {
                high -= 1
            }
            if low == high {
                break
            }
            swap(&array[low], &array[high])
            while (low < high && array[low] < pivotKey) {
                low += 1
            }
            if low == high {
                break
            }
            swap(&array[low], &array[high])
        }
        return low
    }
}
