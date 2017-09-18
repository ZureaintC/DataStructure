//
//  ChildBrotherTree.swift
//  DataStructure
//
//  Created by 付晨 on 2017/8/15.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 孩子兄弟表示法
class ChildBrotherTreeNode{
    var data:AnyObject?
    var firstChild :ChildBrotherTreeNode?
    var rightChild :ChildBrotherTreeNode?
    init(data:AnyObject? = "" as AnyObject?){
        self.data = data
    }
}
class ChildBrotherTree{
    var headNode :ChildBrotherTreeNode?
    var count :Int
    init() {
        count = 0
    }
}
