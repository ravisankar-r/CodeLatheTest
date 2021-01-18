//
//  MockNetworkServiceClass.swift
//  CodeLatheTestTests
//
//  Created by Ravisankar on 18/01/21.
//

import Foundation
import RxSwift
@testable import CodeLatheTest

enum TestError: Error {
    
    case invalidMockData
}

class MockNetworkService: NetworkServiceProtocol {
    
    func getResponse(with urlPath: String) -> Observable<[String : Any]> {
        
        guard let mockData = readFromFile() else {
            return Observable.error(TestError.invalidMockData)
        }
        return Observable.just(mockData)
    }
    
    func readFromFile() -> [String: Any]? {
        
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "MockResponse", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                  if let jsonResult = jsonResult as? Dictionary<String, Any> {
                    return jsonResult
                  }
              } catch {
                   return nil
              }
        }
        return nil
    }
}
