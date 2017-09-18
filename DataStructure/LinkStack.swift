//
//  LinkStack.swift
//  DataStructure
//
//  Created by 付晨 on 2017/8/15.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 栈 链式存储结构

/// 栈节点
class LinkStackNode{
    var data :AnyObject?
    var next :LinkStackNode?
    init(data:AnyObject? = "" as AnyObject?){
        self.data = data
    }
}

/// 栈链表
class LinkStack{
    var top :LinkStackNode?
    var count :Int
    init() {
        count = 0
    }
    
    /// 进栈
    ///
    /// - Parameter elem: 目标节点
    /// - Returns: 是否进栈成功
    func push(elem:AnyObject?) -> Bool{
        let node :LinkStackNode = LinkStackNode(data: elem)
        node.next = top
        top = node
        count += 1
        return true
    }
    
    /// 出栈
    ///
    /// - Returns: 出栈内容
    func pop() -> AnyObject??{
        if count == 0{
         return nil
        }
        var node :AnyObject?
        node = self.top?.data as AnyObject?
        self.top = self.top?.next
        count -= 1
        return node
    }
}
