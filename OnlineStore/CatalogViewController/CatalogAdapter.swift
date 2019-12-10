//
//  CatalogAdapter.swift
//  OnlineStore
//
//  Created by Denis Zayakin on 12/6/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class CatalogAdapter: NSObject, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchControllerDelegate {
    
    var onCategorySelected: ((String) -> Void)?
    var onCategoryUpdate: ((Int) -> Void)?
    var searchController = UISearchController()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DataSource.shared.category.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catalogCell", for: indexPath as IndexPath) as! CatalogTableViewCell
        configureCell(cell: cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onCategorySelected!(DataSource.shared.category[indexPath.section][indexPath.row])
    }
    
    func configureCell(cell: UITableViewCell, forRowAtIndexPath: IndexPath) {
        
        if forRowAtIndexPath.row != 0 {
            cell.textLabel?.textColor = UIColor.lightGray
            cell.textLabel?.text = DataSource.shared.category[forRowAtIndexPath.section][forRowAtIndexPath.row]
        } else {
            cell.textLabel?.textColor = UIColor.darkText
            cell.textLabel?.text = DataSource.shared.category[forRowAtIndexPath.section][forRowAtIndexPath.row]
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        DataSource.shared.arrFilter.removeAll(keepingCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (DataSource.shared.category as NSArray).filtered(using: searchPredicate)
        DataSource.shared.arrFilter = array as! [String]
        
        onCategoryUpdate!(1)
    }
}
