//
//  HashTable.swift
//  DataStructure
//
//  Created by 付晨 on 2017/9/14.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 哈希表长
var HashTableLength:Int = 0

/// 哈希表
class HashTable{
    var elem:Array<Int>?
    var count:Int?
    
    func initHashTable(length:Int){
        elem = Array()
        HashTableLength = length
        count = HashTableLength
        for _ in 0..<HashTableLength{
            elem?.append(Int.min)
        }
    }
    private func hash(key:Int) -> Int{
        return key % HashTableLength //除留余数法
    }
    func insert(key:Int){
        var addr = hash(key: key)
        while self.elem?[addr] != Int.min {
            addr = hash(key: addr + 1)
        }
        self.elem?[addr] = key
    }
    func search(key:Int) -> Int{
        var addr = hash(key: key)
        while (self.elem?[addr] != key){
            addr = hash(key: key + 1)
            if self.elem?[addr] == Int.min || addr == hash(key: key){
                return -1
            }
        }
        return addr
    }
}
