//
//  ViewModel.swift
//  TestPryaniky
//
//  Created by Konstantin on 22.06.2022.
//

import Foundation

protocol ViewViewModelType {
    var hzObject: ModelObject? { get }
    var pictureObject: ModelObject? { get }
    var selectorObject: ModelObject? { get }
    var viewPozition: [ViewsSubName] { get }
    
    func loadData(completion: @escaping() -> Void)
    
    func descriptionObject(name: ViewsSubName, text: String?)
}

enum ViewsSubName: String {
    case hz, selector, picture
}

class ViewModel: ViewViewModelType {
    
    private let dataFetcher = DataFetcherService()
    
    private var pryanikModel: Model? {
        didSet {
            guard let pryanikModel = pryanikModel else {
                return
            }
            for object in pryanikModel.data {
                switch object.name {
                case "hz": self.hzObject = object
                case "picture": self.pictureObject = object
                case "selector": self.selectorObject = object
                default: print("unknown object")
                }
            }
        }
    }
    
    var hzObject: ModelObject?
    var pictureObject: ModelObject?
    var selectorObject: ModelObject?
    
    func descriptionObject(name: ViewsSubName, text: String?) {
        switch name {
        case .hz:
            guard let hz = hzObject else { return }
            print("This object has name: \(hz.name) and description: \(text ?? "")")
            
        case .picture:
            guard let picture = pictureObject else { return }
            print("This object has name: \(picture.name) and description: \(picture.data.text ?? ""))")
            
        case .selector:
            guard let variants = selectorObject?.data.variants else { return }
            for variant in variants {
                if variant.text == text {
                    selectorObject?.data.selectedID = variant.id
                }
            }
            
            guard let selector = selectorObject else { return }
            guard let selectorID = selector.data.selectedID else { return }

            print("This object has name: \(selector.name), selectedId: \(String(selectorID)) and description: \(text ?? "")")
        }
    }
    
    var viewPozition: [ViewsSubName] {
        guard let viewsString = pryanikModel?.view else { return [] }
        let views: [ViewsSubName] = viewsString.compactMap { ViewsSubName(rawValue: $0)}
        return views
    }
    
    func loadData(completion: @escaping() -> Void) {
        dataFetcher.fetchData { [weak self] model in
            guard let self = self else { return }
            self.pryanikModel = model
       
            completion()
        }
    }
    
}
