//
//  ViewModel.swift
//  TestPryaniky
//
//  Created by Konstantin on 22.06.2022.
//

import Foundation

protocol ViewModelType {
    
}

enum ViewsSubName: String {
    case hz, selector, pictures
}

class ViewModel {
    
    private let dataFetcher = DataFetcherService()
    
    private var pryanikModel: Model? {
        didSet {
            
        }
    }
    
    var viewPozition: [ViewsSubName] {
        guard let viewsString = pryanikModel?.view else { return [] }
        let views: [ViewsSubName] = viewsString.compactMap { ViewsSubName(rawValue: $0)}
        return views
    }
    
    func loadData() {
        dataFetcher.fetchData { [weak self] model in
            guard let self = self else { return }
            self.pryanikModel = model
            print(self.pryanikModel?.view)
        }
    }
    
}
