//
//  Fibonacci.swift
//  DataStructure
//
//  Created by 付晨 on 2017/8/15.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 斐波那契数列
class Fibonacci{
    func Fib(i:Int) -> Int{
        if (i<2){
            return i == 0 ? 0 : 1
        }
        return Fib(i:i-1) + Fib(i:i-2)
    }
}
