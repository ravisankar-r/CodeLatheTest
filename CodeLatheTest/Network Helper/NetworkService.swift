//
//  NetworkService.swift
//  CodeLatheTest
//
//  Created by Ravisankar on 18/01/21.
//

import Foundation
import RxSwift

enum NetworkError: Error {
    case genericError
    case invalidURL
}

enum NetworkConstants {
    static let baseURL = "http://api.geonames.org/"
}

final class NetworkService: NetworkServiceProtocol {
    
    func getResponse(with urlPath: String) -> Observable<[String: Any]> {
        
        guard let url = URL(string: NetworkConstants.baseURL + urlPath) else {
            return Observable.error(NetworkError.invalidURL)
        }
        
        return Observable.create { observer in
            
            let task = URLSession.shared.dataTask(with: url,
                                                  completionHandler: { (data, response, error) in
                                                    
                                                    guard let responseData = data,
                                                          let json = try? JSONSerialization.jsonObject(with: responseData,
                                                                                                       options: []) as? [String: Any]
                                                    else {
                                                        return observer.onError(error ?? NetworkError.genericError)
                                                    }
                                                    observer.onNext(json)
                                                  })
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
