//
//  GoodsDetailViewController.swift
//  OnlineStore
//
//  Created by Denis Zayakin on 12/10/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class GoodsDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let adapter = GoodsDetailAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = adapter
        tableView.dataSource = adapter
    }
}
