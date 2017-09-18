//
//  AdjacencyList.swift
//  DataStructure
//
//  Created by 付晨 on 2017/8/16.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation
///邻接表

let a = 10
/// 边表结点
class AdjacencyListEdgeNode {
    var adjvex :Int?  //邻接点域
    var weight :Int? //权值
    var preAdjvex :Int? //进入结点
    var next :AdjacencyListEdgeNode? //链域
    init(){
        self.adjvex = nil
        self.weight = nil
    }
    init(adjvex:Int,weight:Int? = nil) {
        self.adjvex = adjvex
        self.weight = weight
    }
}

/// 顶点表结点
class AdjacencyListVertexNode{
    var data:AnyObject? //数据
    var firstEdge:AdjacencyListEdgeNode? //头指针
    var inVertex :Int  //顶点入度 用于拓扑排序
    init(data:AnyObject? = "" as AnyObject,inVertex :Int = 0) {
        self.data = data
        self.inVertex = inVertex
    }
}

/// 邻接表
class AdjacencyList{
    var adjList :Array<AdjacencyListVertexNode>
    var numVertexes :Int //顶点数
    var numEdges :Int //边数
    init() {
        self.numVertexes = 0
        self.numEdges = 0
        self.adjList = []
    }
    
    /// 创建邻接表 一个五个顶点五条边的邻接表
    func createAdjacencyList(){
        self.numVertexes = 5
        self.numEdges = 5
        for i in 0..<5{
            let adjLv = AdjacencyListVertexNode(data: i as AnyObject)
            adjList.append(adjLv)
        }
        for i in 0..<5{
            let edge = AdjacencyListEdgeNode()
            edge.weight = 100*i + 100
            if i != 4 {
                edge.adjvex = i+1
                edge.preAdjvex = i
            }else{
                edge.adjvex = 1
                edge.weight = 1200
                edge.preAdjvex = 4
            }
            edge.next = adjList[i].firstEdge
            adjList[i].firstEdge = edge
            
            let edge2 = AdjacencyListEdgeNode()
            if i != 4{
                edge2.adjvex = i
                edge2.next = adjList[i+1].firstEdge
                edge2.weight = 100*i + 100
                edge2.preAdjvex = i+1
                adjList[i+1].firstEdge = edge2
            }else{
                edge2.adjvex = 4
                edge2.next = adjList[1].firstEdge
                edge2.weight = 1200
                edge2.preAdjvex = 1
                adjList[1].firstEdge = edge2
            }
            
        }
    }
    
    /// 寻找边结点
    ///
    /// - Parameters:
    ///   - first: 首结点
    ///   - second: 尾结点
    /// - Returns: 边结点
    func findEdge(on first :Int,to second :Int) -> AdjacencyListEdgeNode?{
        var edge = self.adjList[first].firstEdge
        while edge != nil {
            if edge?.adjvex == second{
                return edge
            }
            edge = edge?.next
        }
        return nil
    }
    
    /// 添加结点
    /// 只能按顺序添加结点
    /// - Parameters:
    ///   - first: 初始结点
    ///   - second: 终止结点
    ///   - weight: 权
    func addAdjacencyList(on first:Int,to second:Int,weight:Int?,data :AnyObject? = nil){
        if second == self.numVertexes || first == self.numVertexes{
            self.adjList.append(AdjacencyListVertexNode(data:  data))
            self.numVertexes += 1
        }
        self.numEdges += 2
        let edge = AdjacencyListEdgeNode()
        edge.weight = weight
        edge.adjvex = second
        edge.preAdjvex = first
        edge.next = adjList[first].firstEdge
        adjList[first].firstEdge = edge
        let edge2 = AdjacencyListEdgeNode()
        edge2.weight = weight
        edge2.adjvex = first
        edge2.preAdjvex = second
        edge2.next = adjList[second].firstEdge
        adjList[second].firstEdge = edge2
    }
    /// 深度优先遍历
    func depthFirstSearchTraverse(){
        var visited :Array<Bool> = Array(repeating: false, count: self.numVertexes)
        for i in 0..<self.numVertexes{
            if (!visited[i]){
                depthFirstSearch(i: i,visited: &visited)
            }
        }
    }
    
    /// 深度优先遍历递归
    ///
    /// - Parameters:
    ///   - i: 结点下标
    ///   - visited: 访问标示数组
    private func depthFirstSearch(i:Int,visited : inout Array<Bool>){
        visited[i] = true
        print(self.adjList[i].data)
        var p = self.adjList[i].firstEdge
        while p != nil{
            if !visited[(p?.adjvex)!]{
                depthFirstSearch(i: (p?.adjvex)!, visited: &visited)
            }
            p = p?.next
        }
    }
    
    /// 广度优先遍历
    /// 使用队列进行迭代遍历
    func breadthFirstSearchTraverse(){
        let q = LinkQueue()
        var visited :Array<Bool> = Array(repeating: false, count: self.numVertexes)
        for i in 0 ..< self.numVertexes{
            if !visited[i]{
                visited[i] = true
                print(self.adjList[i].data)
                q.enQueue(elem: self.adjList[i])
                while q.count == 0 {
                    var p = self.adjList[i].firstEdge
                    while p != nil {
                        if !visited[(p?.adjvex)!]{
                            visited[(p?.adjvex)!] = true
                            print(self.adjList[(p?.adjvex)!].data)
                            q.enQueue(elem: self.adjList[(p?.adjvex)!])
                        }
                        p = p?.next
                    }
                }
            }
        }
    }
    
    /// 最小生成树Prim算法
    /// 没有进行大量数据测试,有可能有错
    /// - Parameters:
    ///   - index: 当前结点
    ///   - edgeArray: 边集
    ///   - visited: 是否访问数组
    ///   - miniSpanAjdvex: 最小生成树结点
    func miniSpanTree_Prim(index:Int,edges :Array<AdjacencyListEdgeNode> = [],visited:Array<Bool> = [],miniSpanAjdvex : Array<Int> = [],miniSpanEdge :Array<AdjacencyListEdgeNode> = []){
        if miniSpanAjdvex.count != self.adjList.count{
            var visited :Array<Bool> = visited
            var edges :Array<AdjacencyListEdgeNode> = edges
            var miniSpanAjdvex :Array<Int> = miniSpanAjdvex
            var miniSpanEdge :Array<AdjacencyListEdgeNode> = miniSpanEdge
            if visited.count != self.adjList.count{
                visited = Array.init(repeating: false, count: self.adjList.count)
            }
            
            visited[index] = true
            var edge = self.adjList[index].firstEdge
            while edge != nil {
                edges.append(edge!)
                edge = edge?.next
            }
            var min = Int.max
            var minAjdvex :Int? = nil
            var edgeIndex :Int? = nil
            for i in 0..<edges.count{
                if edges[i].weight! < min && !visited[edges[i].adjvex!]{
                    min = edges[i].weight!
                    edgeIndex = i
                    minAjdvex = edges[i].adjvex
                }
            }
            if edgeIndex != nil{
                miniSpanEdge.append(edges[edgeIndex!])
                print("顶点:\(edges[edgeIndex!].preAdjvex)-->顶点:\(edges[edgeIndex!].adjvex),权值为：\(edges[edgeIndex!].weight)")
                miniSpanAjdvex.append(edges[edgeIndex!].preAdjvex!)
                edges.remove(at: edgeIndex!)
            }
            if minAjdvex != nil{
                miniSpanTree_Prim(index: minAjdvex!, edges: edges, visited: visited, miniSpanAjdvex: miniSpanAjdvex)
            }
        }
    }
    
    /// 最小生成树Kruskal算法
    func miniSpanTree_Kruskal(){
        var n,m :Int
        var edges :Array<AdjacencyListEdgeNode> = []
        var parent :Array<Int> = Array.init(repeating: 0, count: self.numVertexes) //记录是否形成环路
        for i in 0 ..< self.numVertexes{
            var edgeNode = self.adjList[i].firstEdge
            while edgeNode != nil {
                var flag = false
                for edge in edges{
                    if edgeNode?.preAdjvex == edge.adjvex && edgeNode?.adjvex == edge.preAdjvex{
                        flag = true
                    }
                }
                if !flag {
                    edges.append(edgeNode!)
                    
                }
                edgeNode = edgeNode?.next
            }
        }
        edges.sort(by: {$0.weight! < $1.weight!})
        for edge in edges {
            n = miniSpanTree_Kruskal_Find(parent: parent, f: edge.preAdjvex!);
            m = miniSpanTree_Kruskal_Find(parent: parent, f: edge.adjvex!)
            if (n != m){
                parent[n] = m
                print("顶点：\(edge.preAdjvex)-->顶点：\(edge.adjvex),权值为:\(edge.weight)")
            }
        }
    }
    private func miniSpanTree_Kruskal_Find(parent :Array<Int>,f:Int) -> Int{
        var f = f
        while parent[f] > 0{
            f = parent[f]
        }
        return f
    }
    
    /// 最短路径Dijkstra算法
    ///
    /// - Parameter node: 求结点node到其余节点的最短距离
    func shortestPaths_Dijkstra(node:Int){
        var k = 0
        var min = Int.max
        var patharc :Array<Int?> = Array(repeating: 0, count: self.numVertexes) //前驱结点下标
        var shortPathTable :Array<Int>  = Array(repeating: Int.max, count: self.numVertexes)//node到[i]的最短路径长度和
        var final:Array<Int> = Array(repeating: 0, count: self.numVertexes)
        final[node] = 1
        for _ in 0..<self.numVertexes{
            var temp = self.adjList[node].firstEdge
            while temp != nil {
                shortPathTable[(temp?.adjvex)!] = (temp?.weight)!
                temp = temp?.next
            }
        }
        for _ in 1..<self.numVertexes{
            min = Int.max
            for w in 0..<self.numVertexes{
                if final[w] == 0  && shortPathTable[w] < min {
                    k = w
                    min = shortPathTable[w]
                }
            }
            final[k] = 1
            for w in 0..<self.numVertexes{
                let edge = findEdge(on: k, to: w)
                if edge != nil{
                    if final[w] == 0 && min + (edge?.weight)! < shortPathTable[w]{
                        shortPathTable[w] = min + (edge?.weight)!
                        patharc[w] = k
                    }
                }
            }
        }
        print(shortPathTable)
        print(patharc)
    }

    /// 最短路径 Floyd算法
    func shortestPaths_Floyd(){
        var pathmatirx :Array<Array<Int>> = Array(repeating: Array(repeating: 0, count: self.numVertexes), count: self.numVertexes) //前驱结点下标
        var shortPathTable :Array<Array<Int>>  = Array(repeating: Array(repeating: 0, count: self.numVertexes), count: self.numVertexes)//node到[i]的最短路径长度和
        for v in 0..<self.numVertexes{
            for w in 0..<self.numVertexes {
                let edge = findEdge(on: v, to: w)
                if edge != nil{
                    shortPathTable[v][w] = (edge?.weight)!
                }else{
                    shortPathTable[v][w] = Int.max
                }
                pathmatirx[v][w] = w
            }
        }
        for k in 0..<self.numVertexes{
            for v in 0..<self.numVertexes{
                for w in 0..<self.numVertexes{
                    if shortPathTable[v][k] != Int.max && shortPathTable[k][w] != Int.max{
                        if shortPathTable[v][w] > shortPathTable[v][k] + shortPathTable[k][w]{
                            shortPathTable[v][w] = shortPathTable[v][k] + shortPathTable[k][w]
                            pathmatirx[v][w] = pathmatirx[v][k]
                        }
                    }
                }
            }
        }
        //显示
        var k = 0
        for v in 0..<self.numVertexes{
            for w in v+1..<self.numVertexes{
                print("顶点:\(v)->顶点\(w),权:\(shortPathTable[v][w])")
                k = pathmatirx[v][w]
                print("源点:\(v)")
                while k != w {
                    print("->\(k)")
                    k = pathmatirx[k][w]
                }
                print("->\(w)")
            }
            print("\n")
        }
    }
    
    /// 拓扑排序 针对有向图
    /// - TODO: 未测试，或存在错误
    /// - Returns: 是否存在环
    func topologicalSort() -> Bool{
        var edge :AdjacencyListEdgeNode = AdjacencyListEdgeNode()
        var stack :LinkStack = LinkStack()
        var count = 0
        var k = 0
        for i in 0..<self.numVertexes{
            if (self.adjList[i].inVertex != nil){
                stack.push(elem: self.adjList[i])
            }
        }
        while stack.count != 0{
            var getTop = stack.pop() as! AdjacencyListVertexNode
            print(getTop.data)
            count += 1
            var topEdge = getTop.firstEdge
            while topEdge != nil {
                k = (topEdge?.adjvex)!
                self.adjList[k].inVertex -= 1
                if self.adjList[k].inVertex == 0{
                    stack.push(elem: self.adjList[k])
                }
                topEdge = topEdge?.next
            }
        }
        if count < self.numVertexes{
            return false
        }else{
            return true
        }
        
    }
    
    /// 拓扑排序 用于关键路径计算
    ///
    /// - Returns: 是否有环
    private func topologicalSort_criticalPath() -> (Array<Int>,LinkStack){
        var edge :AdjacencyListEdgeNode = AdjacencyListEdgeNode()
        let stack :LinkStack = LinkStack()
        let stack2 :LinkStack = LinkStack()
        var earlyTime :Array<Int> = Array(repeatElement(0, count: numVertexes))
        var count = 0
        var k = 0
        for i in 0..<self.numVertexes{
            if (self.adjList[i].inVertex != nil){
                stack.push(elem: self.adjList[i])
            }
        }
        while stack.count != 0{
            var getTop = stack.pop() as! AdjacencyListVertexNode
            count += 1
            stack2.push(elem: getTop)
            var topEdge = getTop.firstEdge
            while topEdge != nil {
                k = (topEdge?.adjvex)!
                self.adjList[k].inVertex -= 1
                if self.adjList[k].inVertex == 0{
                    stack.push(elem: self.adjList[k])
                }
                if earlyTime[(topEdge?.preAdjvex)!] + (topEdge?.weight)! > earlyTime[k]{
                    earlyTime[k] = earlyTime[(topEdge?.preAdjvex!)!] + (topEdge?.weight)!
                }
                topEdge = topEdge?.next
            }
        }
        return (earlyTime,stack2)
    }
    
    /// 关键路径算法
    func criticalPath(){
        let (earlyTime,stack) = topologicalSort_criticalPath()
        var lateTime :Array<Int> = []
        var earlyTimeV = 0
        var lateTimeV = 0
        var k = 0
        for i in 0..<self.numVertexes{
            lateTime.append(earlyTime[i])
        }
        while stack.count != 0{
            let getTop = stack.pop() as! AdjacencyListVertexNode
            var topEdge = getTop.firstEdge
            while topEdge != nil {
                k = (topEdge?.adjvex)!
                if lateTime[k] - (topEdge?.weight)! < lateTime[(topEdge?.preAdjvex)!]{
                    lateTime[(topEdge?.preAdjvex)!] = lateTime[k] - (topEdge?.weight)!
                }
                topEdge = topEdge?.next
            }
            for i in 0..<self.numVertexes{
                var edge = self.adjList[i].firstEdge
                while edge != nil {
                    k = (edge?.adjvex)!
                    earlyTimeV = earlyTime[i]
                    lateTimeV = lateTime[k] - (edge?.weight)!
                    if earlyTimeV == lateTimeV {
                        print("顶点:\(i)->顶点:\(k),权:\(edge?.weight)")
                    }
                    edge = edge?.next
                }
            }
        }
    }
}
