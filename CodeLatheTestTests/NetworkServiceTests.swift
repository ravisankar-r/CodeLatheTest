//
//  NetworkServiceTests.swift
//  CodeLatheTestTests
//
//  Created by Ravisankar on 18/01/21.
//

import XCTest
import OHHTTPStubs
import RxBlocking
import RxSwift
@testable import CodeLatheTest

class NetworkServiceTests: XCTestCase {

    override func setUpWithError() throws {
        
        stub(condition: { request in
            
            return (request.url?.absoluteString.contains("testPath") ?? false)
        }, response: { _ in
            let obj = ["result":"success"]
            return HTTPStubsResponse(jsonObject: obj, statusCode: 200, headers: nil)
        })
    }

    func testGetResponseFromNetwork() throws {
       
        let expectation = XCTestExpectation(description: "Network response expectation")
        let networkService = NetworkService()
        _ = networkService.getResponse(with: "testPath").subscribe(onNext: { response in
            
            guard let result = response["result"] as? String else {
                XCTFail("Unexpected response")
                return
            }
            XCTAssertEqual(result, "success")
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 1.0)
    }

}
