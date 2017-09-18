//
//  Match.swift
//  DataStructure
//
//  Created by 付晨 on 2017/8/15.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import Foundation

/// 串模式匹配算法
class StringMatch{
    
    /// 暴力匹配算法
    ///
    /// - Parameters:
    ///   - s: 主串
    ///   - t: 子串
    /// - Returns: 匹配位置
    func bruteForce(s:String,t:String) -> Int?{
        var i :Int = 0 //主串指针
        var j :Int = 0 //子串指针
        var sCharacterArray:[Character] = [] //将string转为字符数组
        for character in s.characters {
            sCharacterArray.append(character)
        }
        var tCharacterArray:[Character] = []
        for character in t.characters {
            tCharacterArray.append(character)
        }
        while(i < sCharacterArray.count && j < tCharacterArray.count){
            if sCharacterArray[i] == tCharacterArray[j]{
                j += 1
                i += 1
            }else{
                i = i - j + 1
                j = 0
            }
        }
        if j == tCharacterArray.count{
            return i - tCharacterArray.count
        }else{
            return nil
        }
    }
    
    /// kmp算法
    ///
    /// - Parameters:
    ///   - t: 主串
    ///   - s: 子串
    /// - Returns: 匹配位置
    func kmp(t:String,s:String) -> Int?{
        var i :Int = 0 //主串指针
        var j :Int = 0 //子串指针
        var sCharacterArray:[Character] = [] //将string转为字符数组
        for character in s.characters {
            sCharacterArray.append(character)
        }
        var tCharacterArray:[Character] = []
        for character in t.characters {
            tCharacterArray.append(character)
        }
        let next = kmp_getNext(t: sCharacterArray)
        while(j < sCharacterArray.count && i < tCharacterArray.count){
            if j < 0||tCharacterArray[i] == sCharacterArray[j]{
                j += 1
                i += 1
            }else{
                j = next[j]
                
            }
        }
        if j == sCharacterArray.count{
            return i - sCharacterArray.count
        }else{
            return nil
        }
    }
    
    /// kmp获取next数组
    ///
    /// - Parameter t: 模式串
    /// - Returns: next数组
    private func kmp_getNext(t:Array<Character>) -> Array<Int>{
        var j = 0
        var i = -1
        var next :Array<Int> = []
        for _ in 0..<t.count{
            next.append(0)
        }
        next[0] = -1
        
        //        for i in 1..<t.count{
        //            while j>0 && t[i] != t[j] {
        //                j = next[j-1]
        //            }
        //            if (t[i] == t[j]){
        //                j += 1
        //            }
        //            next[i] = j
        //        }
        while j < t.count - 1{
            if(0 > i || t[j]==t[i]){
                j += 1
                i += 1
                next[j] = i
            }else{
                i = next[i]
            }
        }
        print(next)
        return next
    }
    
}
