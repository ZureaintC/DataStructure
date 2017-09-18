//
//  ThreadedBinaryTree.swift
//  DataStructure
//
//  Created by 付晨 on 2017/8/15.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation
///线索二叉树

/// 全局变量 指向上一个节点
fileprivate var pre :ThreadedBinaryTreeNode?

/// 标记此指针式指向孩子还是指向前驱或后继的线索
///
/// - Link: 表示是指向孩子的指针
/// - Thread: 表示是指向前驱或后继的线索
enum PointerTag : Int{
    case Link = 0
    case Thread = 1
}
class ThreadedBinaryTreeNode{
    var data :AnyObject?
    var leftChild :ThreadedBinaryTreeNode?
    var rightChild :ThreadedBinaryTreeNode?
    var leftTag :PointerTag
    var rightTag :PointerTag
    init(data:AnyObject? = "" as AnyObject?){
        self.data = data
        self.leftTag = .Link
        self.rightTag = .Link
    }
    
    /// 中序遍历线索化
    ///
    /// - Parameter p: 根节点
    func InThreading(p:ThreadedBinaryTreeNode?){
        if p != nil {
            InThreading(p: p?.leftChild)
            if p?.leftChild == nil {
                p?.leftTag = .Thread
                p?.leftChild = pre
            }
            if pre?.rightChild == nil{
                pre?.rightTag = .Thread
                pre?.rightChild = p
            }
            pre = p
            InThreading(p: p?.rightChild)
        }
    }
    
    /// 中序遍历线索二叉树
    ///
    /// - Parameter p: 根节点
    func InOrderTraverse(p:ThreadedBinaryTreeNode?){
        var node = p
        while node != nil {
            while node?.leftTag == .Link {
                node = node?.leftChild;
                print(node?.data)
            }
            while node?.rightTag == .Thread {
                node = node?.rightChild
                print(node?.data)
            }
            node = node?.rightChild
        }
    }
}
