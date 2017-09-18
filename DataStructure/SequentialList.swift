//
//  SqList.swift
//  DataStructure
//
//  Created by 付晨 on 2017/8/14.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 线性表 顺序存储结构
struct SequentialList {
    var list :Array<AnyObject?>
    var length :Int
    
    /// 获取线性表顺序存储结构的值
    ///
    /// - Parameters:
    ///   - L: 传入顺序表
    ///   - i: 目标元素位置
    ///   - e: 返回元素
    /// - Returns: 是否获取成功
    func getElem(index:Int) -> AnyObject??{
        if self.length == 0 || index < 1 || index > self.length{
            return nil
        }
        return self.list[index - 1]
    }
    
    /// 插入操作
    ///
    /// - Parameters:
    ///   - index: 插入位置
    ///   - elem: 插入内容
    /// - Returns: 是否插入成功
    mutating func ListInsert(index: Int,elem: AnyObject?) ->Bool{
        if self.length == self.list.count{
            //顺序线性表满
            return false
        }
        if index < 1 || index > self.length + 1{
            //i不在范围内
            return false
        }
        if index <= self.length{
            for k in self.length - 1 ..< index {
                self.list[k + 1] = self.list[k]
            }
        }
        self.list[index - 1] = elem
        self.length += 1
        return true
    }
    
    /// 删除操作
    ///
    /// - Parameters:
    ///   - index: 删除位置
    /// - Returns: 是否删除成功
    mutating func ListDelete(index:Int) -> Bool{
        if self.length == 0 {
            //线性表为空
            return false
        }
        if index < 1 || index > self.length{
            //i越界
            return false
        }
        if index < self.length{
            for k in index ..< self.length{
                self.list[k - 1] = self.list[k]
            }
        }
        self.length -= 1
        return true
    }
}

