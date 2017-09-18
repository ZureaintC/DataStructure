//
//  SequentialStack.swift
//  DataStructure
//
//  Created by 付晨 on 2017/8/15.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation
//栈的顺序存储结构
struct SequentialStack{
    var list:Array<AnyObject?>
    var top: Int = -1
    /// 进栈
    ///
    /// - Parameter elem: 目标节点
    /// - Returns: 是否进栈成功
    mutating func push(elem :AnyObject?) -> Bool{
        if self.top == list.count{//是否栈满
            return false
        }
        self.top += 1
        self.list[self.top] = elem
        return true
    }
    
    /// 出栈
    ///
    /// - Returns: 出栈节点
    mutating func pop() -> AnyObject??{
        if self.top == -1 {
            return nil
        }
        let e :AnyObject? = self.list[top]
        self.top -= 1
        return e
    }
}
