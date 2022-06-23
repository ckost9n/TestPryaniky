//
//  DataFetcherService.swift
//  Movie Dreams
//
//  Created by Konstantin on 01.06.2022.
//

import Foundation

class DataFetcherService {
    
    private let url = "https://pryaniky.com/static/json/sample.json"
    
    var dataFetcher: DataFetcher!
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchData(completion: @escaping (Model?) -> Void) {
        dataFetcher.fetchGnericJSONData(urlString: url, response: completion)
    }
    
}
