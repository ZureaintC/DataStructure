//
//  parentTree.swift
//  DataStructure
//
//  Created by 付晨 on 2017/8/15.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 双亲表示法 顺序存储结构
class ParentTreeNode{
    var data :AnyObject?
    var parent :ParentTreeNode?
    init(data:AnyObject? = "" as AnyObject?) {
        self.data = data
    }
}
class ParentTree{
    var nodes :Array<ParentTreeNode>
    var root :Int?
    var count :Int
    init(){
        self.nodes = []
        self.root = nil
        self.count = 0
    }
}
