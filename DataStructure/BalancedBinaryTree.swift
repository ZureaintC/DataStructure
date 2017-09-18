//
//  BalancedBinaryTree.swift
//  DataStructure
//
//  Created by 付晨 on 2017/9/14.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 平衡二叉树
class BalancedBinaryTreeNode{
    var data:Int?
    var balanceFactor:Int = 0
    var lchild,rchild :BalancedBinaryTreeNode?
    
    /// 插入操作
    /// - TODO: 在处理双旋的时候有问题，待解决
    /// - Parameters:
    ///   - t: 目标节点
    ///   - e: 值
    ///   - taller: 是否长高
    /// - Returns: 插入是否成功
    func insert(t: BalancedBinaryTreeNode?,e:Int)-> (state:Bool,node:BalancedBinaryTreeNode?,taller:Bool){
        var t = t
        var taller = true
        if t == nil{
            t = BalancedBinaryTreeNode()
            t?.data = e
            t?.lchild = nil
            t?.rchild = nil
            t?.balanceFactor = BalanceFactor.EH.rawValue
            taller = true
        }else{
            if e == t?.data{
                taller = false
                return (false,nil,taller)
            }
            if e < (t?.data!)!{
                var ins = insert(t: t?.lchild, e: e)
                t?.lchild = ins.node
                taller = ins.taller
                if !ins.state{
                    return (false,nil,taller)
                }
                if taller{
                    switch t!.balanceFactor {
                    case BalanceFactor.LH.rawValue:
                        t = leftBalance(t: t!)
                        taller = false
                        break
                    case BalanceFactor.EH.rawValue:
                        t?.balanceFactor = BalanceFactor.LH.rawValue
                        taller = true
                        break
                    case BalanceFactor.RH.rawValue:
                        t?.balanceFactor = BalanceFactor.EH.rawValue
                        taller = false
                        break
                    default:
                        break
                    }
                }
            }else{
                var ins = insert(t: t?.rchild, e: e)
                t?.rchild = ins.node
                taller = ins.taller
                if !ins.state{
                    return (false,nil,taller)
                }
                if (taller){
                    switch t!.balanceFactor {
                    case BalanceFactor.LH.rawValue:
                        t?.balanceFactor = BalanceFactor.EH.rawValue
                        taller = false
                        case BalanceFactor.EH.rawValue:
                            t?.balanceFactor = BalanceFactor.RH.rawValue
                        break
                    case BalanceFactor.EH.rawValue:
                        t?.balanceFactor = BalanceFactor.EH.rawValue
                        taller = true
                        break
                    case BalanceFactor.RH.rawValue:
                        t = rightBalance(t: t!)
                        taller = false
                        break
                    default:
                        break
                    }
                }
            }
        }
        return (true,t,taller)
    }
    /// 右旋操作
    /// 将当前节点的左子树的右子树交给当前节点的左子树
    /// - Parameter p: 当前节点
    private func rightRotate(p:BalancedBinaryTreeNode) -> BalancedBinaryTreeNode? {
        var p = p
        var l :BalancedBinaryTreeNode
        l = p.lchild!
        p.lchild = l.rchild
        l.rchild = p
        p = l
        return p
    }
    
    /// 左旋操作
    ///将当前节点的右子树的左子树交给当前节点的右子树
    /// - Parameter p: 当前节点
    private func leftRotate(p:BalancedBinaryTreeNode) -> BalancedBinaryTreeNode?{
        var p = p
        var r :BalancedBinaryTreeNode
        r = p.rchild!
        p.rchild = r.lchild
        r.lchild = p
        p = r
        return p
    }
    
    /// 左平衡操作
    ///
    /// - Parameter t: 平衡节点
    private func leftBalance(t:BalancedBinaryTreeNode) -> BalancedBinaryTreeNode{
        var t = t
        var l,lr :BalancedBinaryTreeNode
        l = t.lchild!
        switch l.balanceFactor {
        case BalanceFactor.LH.rawValue:
            t.balanceFactor = BalanceFactor.EH.rawValue
            l.balanceFactor = BalanceFactor.EH.rawValue
            t = rightRotate(p: t)!
            break
        case BalanceFactor.RH.rawValue :
            lr = l.rchild!
            switch lr.balanceFactor {
            case BalanceFactor.LH.rawValue:
                t.balanceFactor = BalanceFactor.RH.rawValue
                l.balanceFactor = BalanceFactor.EH.rawValue
                break
            case BalanceFactor.EH.rawValue:
                t.balanceFactor = BalanceFactor.EH.rawValue
                l.balanceFactor = BalanceFactor.EH.rawValue
                break
            case BalanceFactor.RH.rawValue:
                t.balanceFactor = BalanceFactor.EH.rawValue
                l.balanceFactor = BalanceFactor.LH.rawValue
                break
            default:
                break
            }
            lr.balanceFactor = BalanceFactor.EH.rawValue
            t.lchild = leftRotate(p: t.lchild!)
            t = rightRotate(p: t)!
            break
        default:
            break
        }
        return t
    }
    
    /// 右平衡操作
    ///
    /// - Parameter t: 平衡节点
    private func rightBalance(t:BalancedBinaryTreeNode) -> BalancedBinaryTreeNode{
        var t = t
        var r,rl:BalancedBinaryTreeNode
        r = t.rchild!
        switch r.balanceFactor {
        case BalanceFactor.RH.rawValue:
            t.balanceFactor = BalanceFactor.EH.rawValue
            r.balanceFactor = BalanceFactor.EH.rawValue
            t = leftRotate(p: t)!
            break
        case BalanceFactor.RH.rawValue :
            rl = r.lchild!
            switch rl.balanceFactor {
            case BalanceFactor.LH.rawValue:
                t.balanceFactor = BalanceFactor.LH.rawValue
                r.balanceFactor = BalanceFactor.EH.rawValue
                break
            case BalanceFactor.EH.rawValue:
                t.balanceFactor = BalanceFactor.EH.rawValue
                r.balanceFactor = BalanceFactor.EH.rawValue
                break
            case BalanceFactor.RH.rawValue:
                t.balanceFactor = BalanceFactor.EH.rawValue
                r.balanceFactor = BalanceFactor.RH.rawValue
                break
            default:
                break
            }
            rl.balanceFactor = BalanceFactor.EH.rawValue
            t.rchild = rightRotate(p: t.rchild!)
            t = leftRotate(p: t)!
            break
        default:
            break
        }
        return t
    }
}

/// 平衡因子枚举
///
/// - RH: 右高
/// - EH: 等高
/// - LH: 左高
enum BalanceFactor:Int  {
    case RH = -1
    case EH = 0
    case LH = 1
}
