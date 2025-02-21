//
//  MasterViewController.swift
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

protocol MasterDisplayLogic: class {
    func displayFetchedItems(viewModel: Master.FetchItems.ViewModel)
}

class MasterViewController: UIViewController, MasterDisplayLogic {
    
    var interactor: MasterBusinessLogic?
    var router: (NSObjectProtocol & MasterRoutingLogic & MasterDataPassing)?
    
    var items: [String] = []
    let tableView = UITableView()
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = MasterInteractor()
        let presenter = MasterPresenter()
        let router = MasterRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func setupTableView() {
        tableView.backgroundColor = .systemBackground
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupTableView()
        fetchItems()
    }
    
    // MARK: Do something
    private func fetchItems() {
        let request = Master.FetchItems.Request()
        interactor?.fetchItems(request: request)
    }
    
    func displayFetchedItems(viewModel: Master.FetchItems.ViewModel) {
        DispatchQueue.main.async {
            self.items = viewModel.items
            self.tableView.reloadData()
        }
    }
}
