//
//  LinearIndexSearch.swift
//  DataStructure
//
//  Created by 付晨 on 2017/9/13.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 二叉排序树
class BinarySortTreeNode{
    var data:Int?
    var lchild,rchild:BinarySortTreeNode?

    /// 查找
    ///
    /// - Parameters:
    ///   - t: 根节点
    ///   - key: 目标节点
    ///   - f: 当前节点的父节点(不填)
    /// - Returns: 成功返回(true,返回当前节点)，失败返回(false,最后一个节点)
    func search(t :BinarySortTreeNode?,key:Int,f:BinarySortTreeNode? = nil) ->(Bool,BinarySortTreeNode?){
        if t == nil{
            return (false,f)
        }else if key == t?.data{
            return (true,t)
        }else if key < (t?.data)!{
            return search(t: t!.lchild, key: key, f: t)
        }else{
            return search(t: t!.rchild, key: key, f: t)
        }
    }
    
    /// 插入
    ///
    /// - Parameters:
    ///   - t: 目标树
    ///   - key: 值
    /// - Returns: 是否成功
    func insert(key:Int) -> Bool{
        let t = self
        var p = search(t: t, key: key)
        if !p.0{
            let s = BinarySortTreeNode()
            s.data = key
            s.lchild = nil
            s.rchild = nil
            if p.1 == nil{
                p.1 = s
            }else if key < (p.1?.data)!{
                p.1?.lchild = s
            }else{
                p.1?.rchild = s
            }
            return true
        }else{
            return false
        }
    }
    /// 删除节点
    ///
    /// - TODO :待测试
    /// - Parameters:
    ///   - t: 目标节点
    ///   - key: 值
    /// - Returns: 删除后节点
    func deleteBST(t:BinarySortTreeNode?,key:Int) -> BinarySortTreeNode?{
        var t = t
        if t == nil{
            return nil
        }else{
            if key == t?.data{
                t = delete(t: t)
                return t
            }else if key < (t?.data)!{
                return deleteBST(t: t?.lchild, key: key)
            }else {
                return deleteBST(t: t?.rchild, key: key)
            }
        }
    }

    private func delete(t: BinarySortTreeNode?)-> BinarySortTreeNode{
        var q,s:BinarySortTreeNode?
        var t  = t
        if t?.rchild == nil{
            //q = t
            t = t?.lchild
            //q = nil
        }else if t?.lchild == nil {
            //q = t
            t = t?.rchild
            //q = nil
        }else{
            q = t
            s = t?.lchild
            while ((s?.rchild) != nil){
                q = s
                s = s?.rchild
            }
            t?.data = s?.data
            if q?.data != t?.data {
                q?.rchild = s?.lchild
            }else{
                q?.lchild = s?.lchild
            }
            s = nil
        }
        return t!
    }
}
