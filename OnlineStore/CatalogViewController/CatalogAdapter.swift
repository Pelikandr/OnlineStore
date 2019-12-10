//
//  CatalogAdapter.swift
//  OnlineStore
//
//  Created by Denis Zayakin on 12/6/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class CatalogAdapter: NSObject, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchControllerDelegate {
    
    var onCategorySelected: ((Int) -> Void)?
    var onCategoryUpdate: ((Int) -> Void)?
    var searchController = UISearchController()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.searchController.isActive) {
            return DataSource.shared.arrFilter.count
        } else {
            return DataSource.shared.arrCountry.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catalogCell", for: indexPath as IndexPath)
        configureCell(cell: cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onCategorySelected!(1)
    }
    
    func configureCell(cell: UITableViewCell, forRowAtIndexPath: IndexPath) {
        if (self.searchController.isActive) {
            cell.textLabel?.text = DataSource.shared.arrFilter[forRowAtIndexPath.row]
        } else {
            cell.textLabel?.text = DataSource.shared.arrCountry[forRowAtIndexPath.row]
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        DataSource.shared.arrFilter.removeAll(keepingCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (DataSource.shared.arrCountry as NSArray).filtered(using: searchPredicate)
        DataSource.shared.arrFilter = array as! [String]
        
        onCategoryUpdate!(1)
    }
}
