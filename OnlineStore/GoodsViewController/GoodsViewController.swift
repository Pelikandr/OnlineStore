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
    var selectedProduct: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = adapter
        collectionView.dataSource = adapter
        searchBar.delegate = adapter
        searchBar.barTintColor = UIColor.white
        
        adapter.onProductSelected = { [unowned self] (product: Product) in
            self.collectionView.reloadData()
            self.selectedProduct = product
            self.performSegue(withIdentifier: "toGoodsDetailViewController", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? GoodsDetailTableViewController else { return }
        nextVC.selectedProduct = selectedProduct!
    }
}
