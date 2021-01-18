//
//  GetSearchResultsDAO.swift
//  CodeLatheTest
//
//  Created by Ravisankar on 18/01/21.
//

import Foundation
import RxSwift
// We can use Codable as well here
import SwiftyJSON

protocol GetSearchResultsProtocol: AnyObject {
    func getSearchResults(searchString: String) -> Observable<[City]>
}


final class GetSearchResultsDAO {
    
    enum Constants {
        
        static let maxRows = 10
        static let userName = "ravisankar.r"
    }
    
    let networkClient: NetworkServiceProtocol
    
    init(networkClient: NetworkServiceProtocol = NetworkService()) {
        self.networkClient = networkClient
    }
}

extension GetSearchResultsDAO: GetSearchResultsProtocol {
    
    func getSearchResults(searchString: String) -> Observable<[City]> {
        
        guard let percentEncodedString = searchString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return Observable.error(NetworkError.genericError)
        }
        let searchURLPath = "searchJSON?name_startsWith=\(percentEncodedString)&maxRows=\(Constants.maxRows)&username=\(Constants.userName)"
        return networkClient.getResponse(with: searchURLPath).map { response in
            
            let json = JSON(response)
            guard let geoNames = json["geonames"].array else {
                throw NetworkError.genericError
            }
            return geoNames.compactMap { object in
                if let name = object["name"].string,
                   let state = object["adminName1"].string,
                   let country = object["countryName"].string {
                    return City(name: name, country: country, state: state)
                }
                return nil
            }
        }
    }
}
