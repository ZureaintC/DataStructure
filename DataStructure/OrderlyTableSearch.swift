//
//  BinarySearch.swift
//  DataStructure
//
//  Created by 付晨 on 2017/9/13.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation


/// 有序表查找
class OrderlyTableSearch{
    
    /// 折半查找
    ///
    /// - Parameters:
    ///   - a: 数组
    ///   - n: 数组长度 - 1
    ///   - key: 查找的关键字
    /// - Returns: -1为未找到
    func BinarySearch(a:Array<Int>,n:Int,key:Int) -> Int{
        var low,high,mid :Int
        low = 0
        high = n
        while low <= high {
            mid = (low + high) / 2
            if key < a[mid]{
                high = mid - 1
            }else if key > a[mid]{
                low = mid + 1
            }else{
                return mid
            }
        }
        return -1
    }
    
    /// 插值查找 类似于折半查找 只是将mid改写为插值公示 key-a[low]/a[high]-a[low]
    ///
    /// - Parameters:
    ///   - a: 数组
    ///   - n: 数组长度 - 1
    ///   - key: 查找的关键字
    /// - Returns: -1为未找到
    func InterpolationSearch(a:Array<Int>,n:Int,key:Int) -> Int{
        var low,high,mid :Int
        low = 0
        high = n
        while low <= high {
            mid = low + (high - low) * (key - a[low]) / (a[high] - a[low])
            if key < a[mid]{
                high = mid - 1
            }else if key > a[mid]{
                low = mid + 1
            }else{
                return mid
            }
        }
        return -1
    }
    
    /// 斐波那契查找 使用斐波那契数列
    ///
    /// - Parameters:
    ///   - a: 数组
    ///   - n: 数组长度 - 1
    ///   - key: 查找的关键字
    /// - Returns: -1为未找到
    func fibonacciSearch(a:Array<Int>,n:Int,key:Int) -> Int{
        var low,high,mid,k:Int
        let f = Fibonacci()
        low = 1
        high = n
        k = 0
        var b = a
        while n>f.Fib(i: k) - 1{
            k += 1
        }
        for _ in n ..< f.Fib(i: k) - 1{
            b.append(a[n])
        }
        while low <= high {
            mid = low + f.Fib(i: k - 1) - 1
            if key < b[mid]{
                high = mid - 1
                k = k - 1
            }else if key > b[mid]{
                low = mid + 1
                k = k - 2
            }else{
                if mid <= n{
                    return mid
                }else{
                    return n
                }
            }
        }
        return -1
    }
}
