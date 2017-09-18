//
//  DataStructureTests.swift
//  DataStructureTests
//
//  Created by 付晨 on 2017/8/14.
//  Copyright © 2017年 com.fuchen. All rights reserved.
//

import XCTest
@testable import DataStructure

class DataStructureTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        var a = [2,1,4,5,6,7,10,9,8]
        let t :BalancedBinaryTreeNode? = nil
        //        t?.balanceFactor = 0
        //        t?.data = 3
        for i in 0..<9{
            print(t?.insert(t: t, e: a[i]))
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
