//
//  SequentialDoubleStack.swift
//  DataStructure
//
//  Created by 付晨 on 2017/8/15.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation
//两栈共享空间
struct SequentialDoubleStack{
    var data :Array<AnyObject?>
    var top1 :Int
    var top2 :Int
    
    /// 进栈
    ///
    /// - Parameters:
    ///   - elem: 目标节点
    ///   - stackNumber: 栈序号
    /// - Returns: 是否进栈成功
    mutating func push(elem:AnyObject?,stackNumber:Int) -> Bool{
        if self.top1 + 1 == self.top2{//栈满
            return false
        }
        switch stackNumber {
        case 1:
            self.top1 += 1
            self.data[self.top1] = elem
        default:
            self.top2 += 1
            self.data[self.top2] = elem
        }
        return true
    }

    /// 出栈
    ///
    /// - Parameter stackNumber: 栈序号
    /// - Returns: 出栈节点
    mutating func pop(stackNumber:Int) -> AnyObject??{
        var elem :AnyObject?
        switch stackNumber {
        case 1:
            if self.top1 == -1{
                return nil
            }
            elem = self.data[top1]
            self.top1 -= 1
        default:
            if self.top1 == -1{
                return nil
            }
            elem = self.data[self.top2]
            self.top2 -= 1
        }
        return elem
    }
}
