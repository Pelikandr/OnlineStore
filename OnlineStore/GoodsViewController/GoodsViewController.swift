//
//  GoodsViewController.swift
//  OnlineStore
//
//  Created by Denis Zayakin on 12/6/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class GoodsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private let adapter = GoodsAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = adapter
        collectionView.dataSource = adapter
        searchBar.delegate = adapter
        searchBar.barTintColor = UIColor.white
        
        adapter.onProductSelected = { [unowned self] (product: Product) in
            self.collectionView.reloadData()
            self.performSegue(withIdentifier: "toGoodsDetailViewController", sender: nil)
        }
    }
}
