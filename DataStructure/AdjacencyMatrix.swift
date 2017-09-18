//
//  AdjacencyMatrix.swift
//  DataStructure
//
//  Created by 付晨 on 2017/8/16.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation
///邻接矩阵
///- vex: 顶点表
///- arc:邻接矩阵
///- numVertexes: 顶点数
///- numEdges: 边数
struct MGraph {
    var vexs:Array<Int> //顶点表
    var arc :Array<Array<Int>> = [[Int]]() //邻接矩阵（边表）
    var numVertexes :Int//顶点数
    var numEdges :Int//边数
}
