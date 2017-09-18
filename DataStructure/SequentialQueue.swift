//
//  SequentialQueue.swift
//  DataStructure
//
//  Created by 付晨 on 2017/8/15.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation
//循环队列 顺序存储     ps:未写普通队列顺序存储结构
struct SequentialQueue{
    var data :Array<AnyObject?>?
    var frout :Int
    var rear :Int
    
    init() {
        self.frout = 0
        self.rear = 0
    }
    
    /// 获取队列长度
    /// 公式(rear-front+QueueSize)%QueueSize
    /// - Returns: 队列长度
    func QueueLength() -> Int{
        return (self.rear - self.frout + (self.data?.count)! ) % (self.data?.count)!
    }
    
    /// 进队
    ///
    /// - Parameter elem: 目标节点
    /// - Returns: 是否进队成功
    mutating func enQueue(elem:AnyObject?) -> Bool{
        if (self.rear + 1) % (self.data?.count)! == self.frout {//判断队列是否满
            return false
        }
        self.data?[self.rear] = elem
        self.rear = (self.rear + 1) % (self.data?.count)!
        return true
    }
    
    /// 出队
    ///
    /// - Returns: 是否出队成功
    mutating func deQueue() -> AnyObject??{
        if(self.frout == self.rear){//判断队列是否为空
            return nil
        }
        let elem:AnyObject? = self.data![self.frout]
        self.frout = (self.frout + 1) % (self.data?.count)!
        return elem
    }
}
