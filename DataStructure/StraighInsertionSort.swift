//
//  StraighInsertionSort.swift
//  DataStructure
//
//  Created by 付晨 on 2017/9/14.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 直接插入排序
class StraighInsertionSort{
    static let straighInsertionSort = StraighInsertionSort()
    private init(){}
    
    /// 直接插入排序
    ///
    /// - Parameter array: 目标数组
    func insertSort(array:inout Array<Int>){
        for i in 1..<array.count{
            if (array[i]<array[i-1]){
                let temp = array[i]
                var j = i
                while j>0{
                    if temp < array[j-1]{
                        array[j] = array[j-1]
                        j -= 1
                    }else{
                        break
                    }
                }
                array[j] = temp
            }
        }
    }
}
