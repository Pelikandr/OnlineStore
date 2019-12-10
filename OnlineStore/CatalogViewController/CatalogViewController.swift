//
//  SecondViewController.swift
//  OnlineStore
//
//  Created by Denis Zayakin on 12/6/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class CatalogViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let adapter = CatalogAdapter()
    var categoryTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = adapter
        tableView.dataSource = adapter
        
        adapter.onCategoryUpdate = { [unowned self] (int: Int) in
            self.tableView.reloadData()
        }
        
        adapter.onCategorySelected = { [unowned self] (category: String) in
            self.categoryTitle = category
            self.performSegue(withIdentifier: "toGoodsViewController", sender: nil)
        }
        
        adapter.searchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = adapter
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            controller.searchBar.barTintColor = UIColor.white
            
            self.tableView.tableHeaderView = controller.searchBar
    
            return controller
        })()
        
        self.tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.adapter.searchController.isActive = false //.isActive = false
        //self.adapter.searchController.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? GoodsViewController else { return }
        nextVC.navigationItem.title = categoryTitle
    }
}

