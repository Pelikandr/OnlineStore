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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = adapter
        tableView.dataSource = adapter
        
        adapter.onCategorySelected = { [unowned self] (int: Int) in
            self.performSegue(withIdentifier: "toGoodsViewController", sender: nil)
        }
    }
}

