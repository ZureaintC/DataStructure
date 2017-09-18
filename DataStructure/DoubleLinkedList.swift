//
//  DoubleLinkedList.swift
//  DataStructure
//
//  Created by 付晨 on 2017/8/15.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation
/// 链式存储结构
/// 双向链表
class DoubleLinkedListNode{
    var data :AnyObject?
    var prior :DoubleLinkedListNode?//前驱指针
    var next :DoubleLinkedListNode?//后继指针
    init(data :AnyObject? = "" as AnyObject?) {
        self.data = data
    }
}
class DoubleLinkedList{
    var headNode :DoubleLinkedListNode?
    var length :Int
    init() {
        headNode = DoubleLinkedListNode()
        length = 0
    }
    
    /// 获取节点
    ///
    /// - Parameter index: 目标序号
    /// - Returns: 目标节点
    func getElem(index:Int) -> DoubleLinkedListNode?{
        var p:DoubleLinkedListNode?
        p = self.headNode?.next
        var j = 0 //计数器
        while p != nil && j<index {
            p = p?.next
            j += 1
        }
        print(j)
        if (p == nil || j>index){
            return nil
        }
        return p
    }
    
    /// 双向链表插入
    ///
    /// - Parameters:
    ///   - index: 目标序号
    ///   - elem: 目标节点
    /// - Returns: 是否成功插入
    func listInsert(index:Int,elem:AnyObject?) -> Bool{
        var j = 0
        var p :DoubleLinkedListNode?
        let s :DoubleLinkedListNode = DoubleLinkedListNode(data: elem)
        p = self.headNode
        while p != nil && j<index {
            p = p?.next
            j += 1
        }
        if (p == nil || j>index){
            return false
        }
        s.prior = p
        s.next = p?.next
        p?.next?.prior = s
        p?.next = s
        self.length += 1
        let last :DoubleLinkedListNode? = getElem(index: length - 1)
        self.headNode?.prior = last
        last?.next = self.headNode
        return true
    }
    
    /// 双向链表删除
    /// - TODO : 会将头结点删除
    /// - Parameter index: 目标序号
    /// - Returns: 是否成功
    func listDelete(index:Int) -> Bool{
        var j = 0
        var p :DoubleLinkedListNode?
        p = self.headNode
        while p != nil && j<index {
            p = p?.next
            j += 1
        }
        if (p == nil || j>index){
            return false
        }
        p?.prior?.next = p?.next
        p?.next?.prior = p?.prior
        self.length -= 1
        return true
    }
}
