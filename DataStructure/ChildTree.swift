//
//  ChildTree.swift
//  DataStructure
//
//  Created by 付晨 on 2017/8/15.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 孩子表示法 表头为顺序存储结构 叶子节点为链式存储结构
class ChildTreeNode{
    var child :Int
    var next :ChildTreeNode?
    init(child:Int) {
        self.child = child
    }
}
class ChildTreeBox{
    var data :AnyObject?
    var firstChild :ChildTreeNode?
    init(data:AnyObject? = "" as AnyObject?) {
        self.data = data
    }
}
class ChildTree{
    var nodes :Array<ChildTreeBox>
    var root :Int?
    var count :Int
    init(){
        self.nodes = []
        self.root = nil
        self.count = 0
    }
}
