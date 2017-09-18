//
//  LinkedList.swift
//  DataStructure
//
//  Created by 付晨 on 2017/8/14.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 链式存储结构
/// 单链存储
class OneDirectionLinkedListNode {
    var data :AnyObject?
    var next :OneDirectionLinkedListNode?
    
    
    init(data:AnyObject? = "" as AnyObject?) {
        self.data = data
    }
}
class OneDirectionLinkedList {
    var headNode :OneDirectionLinkedListNode?
    var tailNode :OneDirectionLinkedListNode?
    var length:Int
    init(){
        self.headNode = OneDirectionLinkedListNode()
        self.tailNode = self.headNode
        self.length = 0
    }
    
    /// 头插法
    ///
    /// - Parameter item: 数组
    func createListHead(item:Array<AnyObject?>){
        var p :OneDirectionLinkedListNode?
        for i in 0..<item.count{
            p = OneDirectionLinkedListNode()
            p?.data = item[i]
            p?.next = self.headNode?.next
            self.headNode?.next = p
            self.length += 1
        }
    }
    /// 尾插法
    ///
    /// - Parameter item: 数组
    func createListTail(item:Array<AnyObject?>){
        var p :OneDirectionLinkedListNode?
        for i in 0..<item.count{
            p = OneDirectionLinkedListNode()
            p?.data = item[i]
            self.tailNode?.next = p
            self.tailNode = p
            self.length += 1
        }
    }
    
    /// 清空链表
    func clearList(){
        var p,q :OneDirectionLinkedListNode?
        p = self.headNode?.next
        while(p != nil){
            q = p?.next
            p = nil
            p = q
        }
        self.headNode?.next = nil
    }
    /// 获取节点
    ///
    /// - Parameters:
    ///   - index: 目标序号
    /// - Returns: 单链存储节点
    func getElem(index:Int) -> OneDirectionLinkedListNode?{
        var p:OneDirectionLinkedListNode?
        p = self.headNode
        var j = 0 //计数器
        while p != nil && j<index {
            p = p?.next
            j += 1
        }
        if (p == nil || j>index){
            return nil
        }
        return p
    }
    
    /// 单向链表插入
    ///
    /// - Parameters:
    ///   - index: 目标序号
    ///   - elem: 目标节点
    /// - Returns: 是否插入成功
    func listInsert(index:Int,elem:AnyObject?) -> Bool{
        var j = 0
        var p :OneDirectionLinkedListNode?
        let s :OneDirectionLinkedListNode = OneDirectionLinkedListNode(data: elem)
        p = self.headNode
        while p != nil && j<index {
            p = p?.next
            j += 1
        }
        if (p == nil || j>index){
            return false
        }
        s.next = p?.next
        p?.next = s
        
        self.length += 1
        return true
    }
    
    /// 单向链表删除
    ///
    /// - Parameter index: 目标序号
    /// - Returns: 是否删除成功
    func listDelete(index:Int) -> Bool{
        var p :OneDirectionLinkedListNode?
        p = self.headNode
        var j = 0 //计数器
        while p != nil && j < index{
            p = p?.next
            j += 1
        }
        if (p == nil || j>index){
            return false
        }
        p?.next = p?.next?.next
        
        self.length -= 1
        
        return true
    }
}
