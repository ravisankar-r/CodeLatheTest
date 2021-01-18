//
//  NetworkServiceProtocol.swift
//  CodeLatheTest
//
//  Created by Ravisankar on 18/01/21.
//

import RxSwift

protocol NetworkServiceProtocol: AnyObject {
    func getResponse(with urlPath: String) -> Observable<[String: Any]>
}
