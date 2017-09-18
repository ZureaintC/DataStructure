//
//  ListQueue.swift
//  DataStructure
//
//  Created by 付晨 on 2017/8/15.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 队列链式存储结构

/// 队列节点
class LinkQueueNode{
    var data :AnyObject?
    var next :LinkQueueNode?
    init(data:AnyObject? = "" as AnyObject?) {
        self.data = data
    }
}

/// 队列链表
class LinkQueue{
    var front :LinkQueueNode?
    var rear :LinkQueueNode?
    var count :Int
    
    init() {
        self.front = LinkQueueNode()
        self.rear = self.front
        count = 0
    }
    
    /// 入队
    ///
    /// - Parameter elem: 目标内容
    /// - Returns: 是否插入成功
    func enQueue(elem:AnyObject?) -> Bool{
        let node :LinkQueueNode = LinkQueueNode(data:elem)
        self.rear?.next = node
        self.rear = node
        count += 1
        return true
    }
    
    /// 出队
    ///
    /// - Returns: 出队节点
    func deQueue() -> LinkQueueNode?{
//        通过地址判断
//        var frontPoint :UnsafePointer<LinkQueueNode?>? = nil
//        withUnsafePointer(to: &self.front){ point in
//            frontPoint = point
//        }
//        var rearPoint :UnsafePointer<LinkQueueNode?>? = nil
//        withUnsafePointer(to: &self.rear){ point in
//            rearPoint = point
//        }
//        if frontPoint == rearPoint{
//            return nil
//        }
        if self.count <= 0 {
             return nil
        }
        let node = self.front?.next
        self.front?.next = self.front?.next?.next
        count -= 1
        if self.front?.next == nil {
            self.rear = self.front
        }
        return node
    }
}
