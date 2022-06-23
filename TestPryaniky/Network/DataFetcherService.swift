//
//  DataFetcherService.swift
//  Movie Dreams
//
//  Created by Konstantin on 01.06.2022.
//

import Foundation

//enum Categories: String, CaseIterable {
//    case trendingAllDay = "All Trend in day"
//    case trendingAllWeek = "All Trend in week"
//    case trendingMovieDay = "Trend Movie in day"
//    case trendingMovieWeek = "Trend Movie in week"
//    case continueMovie = "Continue watching movies"
//}

class DataFetcherService {
    
    private let rocketsURL = "https://api.spacexdata.com/v4/rockets"
    
//    private let key = "?api_key=3180eef08dadb9ca352d50241ce95409"
    
    var dataFetcher: DataFetcher!
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchData(completion: @escaping ([RocketSpaceX]?) -> Void) {
        dataFetcher.fetchGnericJSONData(urlString: rocketsURL, response: completion)
    }
    
}
