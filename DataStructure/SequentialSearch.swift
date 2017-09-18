//
//  SequentialSearch.swift
//  DataStructure
//
//  Created by 付晨 on 2017/8/21.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 顺序查询
class SequentialSearch{
    
    /// 顺序查找
    ///
    /// - Parameters:
    ///   - a: 数组
    ///   - n: 数组长度 - 1
    ///   - key: 查找的关键字
    /// - Returns: -1 为未找到
    func sequentialSearch(a:Array<Int>,n:Int,key:Int) -> Int{
        for i in 0..<n {
            if a[i] == key  {
                return i
            }
        }
        return -1
    }
    
    /// 顺序查找优化 将第0个位置放置哨兵，免去判断越界，前提顺序表a从1开始
    ///
    /// - Parameters:
    ///   - a: 数组
    ///   - n: 数组长度 - 1
    ///   - key: 查找的关键字
    /// - Returns: 0为未找到
    func sequentialSearch2(a:Array<Int>,n:Int,key:Int) -> Int{
        var b = a
        b[0] = key
        var i = n
        while b[i] != key{
            i -= 1
        }
        return i
    }
}
