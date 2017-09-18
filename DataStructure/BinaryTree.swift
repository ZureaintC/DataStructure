//
//  BinaryTree.swift
//  DataStructure
//
//  Created by 付晨 on 2017/8/15.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation
/// 二叉树的链式存储结构结构  顺序存储结构类似线性表 只不过将未有的孩子数据置空
class BinaryTreeNode{
    var data :AnyObject?
    var leftChild :BinaryTreeNode?
    var rightChild :BinaryTreeNode?
    init(data:AnyObject? = "" as AnyObject?){
        self.data = data
    }
    
    /// 创建二叉树
    /// 由于swift没有控制台输入所以只能生成完全二叉树   ps:可以桥接oc 获得扫描器,然后改写代码
    /// - Parameters:
    ///   - i: 节点序号,不需要输入 递归判断凭证
    ///   - count: 节点数
    /// - Returns: 根节点
    func createTree(i:Int = 1,count:Int) -> BinaryTreeNode?{
        var t : BinaryTreeNode?
        if i > count{
            t = nil
            return t
        }
        t = BinaryTreeNode(data:i as AnyObject?)
        t?.leftChild = createTree(i: i * 2, count: count)
        t?.rightChild = createTree(i:i * 2 + 1,count:count)
        return t
    }

    ///遍历递归写法
    /// 前序遍历
    ///
    /// - Parameter t: 使用时输入根节点
    func preOrderTraverse(t:BinaryTreeNode?){
        if t == nil{
            return
        }
        print(t?.data)
        preOrderTraverse(t: t?.leftChild)
        preOrderTraverse(t: t?.rightChild)
    }
    /// 中序遍历
    ///
    /// - Parameter t: 使用时输入根节点
    func InOrderTraverse(t:BinaryTreeNode?){
        if t == nil{
            return
        }
        InOrderTraverse(t: t?.leftChild)
        print(t?.data)
        InOrderTraverse(t: t?.rightChild)
    }
    /// 后序遍历
    ///
    /// - Parameter t: 使用时输入根节点
    func postOrderTraverse(t:BinaryTreeNode?){
        if t == nil{
            return
        }
        postOrderTraverse(t: t?.leftChild)
        postOrderTraverse(t: t?.rightChild)
        print(t?.data)
    }
    ///遍历迭代写法
    ///由于迭代版后序遍历需要父指针，但在我所设计的数据结构中无父指针。如若想实现可以添加父指针，完成迭代版后序遍历
    /// 前序遍历
    func preOrderTraverseIteration()
    {
        /// 辅助栈
        let s :LinkStack = LinkStack()
        var node :BinaryTreeNode? = self
        while true {
            visitAlongLeftBranch(t: node,s: s)
            if s.count == 0 {break}
            node = s.pop() as! BinaryTreeNode?
        }
    }
    private func visitAlongLeftBranch(t:BinaryTreeNode?, s: LinkStack){
        var node :BinaryTreeNode? = t
        while node != nil {
            print(node?.data)
            s.push(elem: node?.rightChild)
            node = node?.leftChild
        }
    }
    
    /// 中序遍历
    func inOrderTraverseIteration(){
        let s = LinkStack()
        var node :BinaryTreeNode? = self
        while true{
            goAlongLeftBranck(t: node,s: s)
            if s.count == 0 {break}
            node = s.pop() as! BinaryTreeNode?
            print(node?.data)
            node = node?.rightChild
            
        }
    }
    private func goAlongLeftBranck(t:BinaryTreeNode?,s:LinkStack){
        var node :BinaryTreeNode? = t
        while node != nil {
            s.push(elem: node)
            node = node?.leftChild
        }
    }
    
    /// 层次遍历
    func levelTraverseIteration(){
        let q = LinkQueue()
        q.enQueue(elem: self)
        while q.count != 0{
            var node :BinaryTreeNode? = q.deQueue()?.data as! BinaryTreeNode
            print(node?.data)
            if node?.leftChild != nil {
                q.enQueue(elem: node?.leftChild)
            }
            if node?.rightChild != nil{
                q.enQueue(elem: node?.rightChild)
            }
        }
    }
}
