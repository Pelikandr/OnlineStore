//
//  CartViewController.swift
//  OnlineStore
//
//  Created by Denis Zayakin on 12/10/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let adapter = CartAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = adapter
        tableView.delegate = adapter
    }
}
