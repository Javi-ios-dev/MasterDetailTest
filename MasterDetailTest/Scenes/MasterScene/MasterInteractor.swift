//
//  MasterInteractor.swift
//  MasterDetailTest
//
//  Created by Javier Apaez Arcos on 06/02/25.
//  Copyright (c) 2025 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MasterBusinessLogic
{
    func fetchItems(request: Master.FetchItems.Request)
}

protocol MasterDataStore
{
    var items: [ItemElement]? {get}
}

class MasterInteractor: MasterBusinessLogic, MasterDataStore
{
    
    
    var presenter: MasterPresentationLogic?
    var worker: MasterWorker?
    
    var items: [ItemElement]?
    
    // MARK: Fetch items
    
    func fetchItems(request: Master.FetchItems.Request) {
        worker = MasterWorker()
        worker?.fetchItems { result in
            switch result {
            case .success(let items):
                self.items = items
                let response = Master.FetchItems.Response(items: items)
                self.presenter?.presentFetchedItems(response: response)
            case .failure:
                break 
            }
        }
    }
}
