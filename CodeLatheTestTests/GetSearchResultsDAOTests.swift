//
//  GetSearchResultsDAOTests.swift
//  CodeLatheTestTests
//
//  Created by Ravisankar on 18/01/21.
//

import XCTest
import RxBlocking
@testable import CodeLatheTest

class GetSearchResultsDAOTests: XCTestCase {

    let mockNetworkHandler = MockNetworkService()

    func testGetSearchResults() throws {
        
        let dao = GetSearchResultsDAO(networkClient: mockNetworkHandler)
        guard let cities = try? dao.getSearchResults(searchString: "test").toBlocking().first() else {
            XCTFail(" Failed to get response from network")
            return
        }
        XCTAssert(cities.count == 10)
    }

}
