//
//  AlamofreMapperTests.swift
//  AlamofreMapperTests
//
//  Created by Sua Le on 8/21/18.
//  Copyright © 2018 Sua Le. All rights reserved.
//

import XCTest
import Alamofire
@testable import AlamofreMapper

class AlamofreMapperTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetListUsers() {
        Alamofire.request("https://reqres.in/api/users", method: .get
            , parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<UserResponse>) in
                switch response.result {
                case let .success(data):
                    dump(data)
                case let .failure(error):
                    dump(error)
                }
        }
        
        assert(true)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
