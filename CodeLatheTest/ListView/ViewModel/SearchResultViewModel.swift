//
//  ViewModel.swift
//  CodeLatheTest
//
//  Created by Ravisankar on 18/01/21.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa

class SearchResultViewModel {
    
    private let disposebag = DisposeBag()
    private let _cities = BehaviorRelay<[City]>(value: [])
    private let dao: GetSearchResultsProtocol
    private var cityObservable: Observable<[City]>?
    
    init(dao: GetSearchResultsProtocol = GetSearchResultsDAO(),
         searchString: Observable<String?>,
         didPressButton: Observable<Void>) {
        self.dao = dao
        _ = didPressButton.withLatestFrom(searchString).subscribe(onNext: { searchString in
            
            self.getSearchResults(searchString: searchString ?? "")
        })
    }
    
    var cities: Driver<[City]> {
        return _cities.asDriver()
    }
    
    func getSearchResults(searchString: String) {
        
        _ = dao.getSearchResults(searchString: searchString).subscribe(onNext: { (cityResponse) in
            self._cities.accept(cityResponse)
        })
    }
}
