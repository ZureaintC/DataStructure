//
//  BubbleSort.swift
//  DataStructure
//
//  Created by 付晨 on 2017/9/14.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation
class BubbleSort{
    static let bubbleSort  = BubbleSort()
    private init() {}
    
    /// 冒泡排序初级版
    /// 无动态规划，从上到下逐个排序
    /// - Parameter array: 目标数组
    func bubbleSort0(array:inout Array<Int>){
        for i in 0..<array.count{
            for j in 1..<array.count{
                if array[i] > array[j]{
                    swap(&array[i], &array[j])
                }
            }
        }
    }

    /// 冒泡排序
    /// 从下到上，逐一冒泡，同时也会将更轻的向上冒泡
    /// - Parameter array: 目标数组
    func bubbleSort1(array:inout Array<Int>){
        for i in 0..<array.count{
            for j in (i ..< array.count).reversed(){
                if array[i] > array[j]{
                    swap(&array[i], &array[j])
                }
            }
        }
    }
    
    /// 冒泡排序优化
    /// 若数组已经有序，则会跳出，不再进行之后的for循环
    /// - Parameter array: 目标数组
    func bubbleSort2(array:inout Array<Int>){
        var flag = true
        for i in 0..<array.count {
            if flag == false{
                break
            }
            flag = false
            for j in (i ..< array.count).reversed(){
                if array[i] > array[j]{
                    swap(&array[i], &array[j])
                    flag = true
                }
            }
        }
    }
}
