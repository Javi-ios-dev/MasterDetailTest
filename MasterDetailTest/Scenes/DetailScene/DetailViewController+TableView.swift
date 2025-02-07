//
//  DetailViewController+TableView.swift
//  MasterDetailTest
//
//  Created by Javier Apaez Arcos on 06/02/25.
//

import UIKit

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.itemData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomDetailTableViewCell
        
        let item = itemData[indexPath.row]
        cell.configure(with: item.0, value: item.1)
        return cell
    }
}
