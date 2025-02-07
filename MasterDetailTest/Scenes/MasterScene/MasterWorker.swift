//
//  MasterWorker.swift
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

class MasterWorker
{
    let apiService = APIService()
    
    func fetchItems(completion: @escaping (Result<[ItemElement], Error>) -> Void) {
        apiService.fetchItems(completion: completion)
    }
}
