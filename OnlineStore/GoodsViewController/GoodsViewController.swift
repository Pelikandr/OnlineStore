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
    
    private let adapter = GoodsAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = adapter
        collectionView.dataSource = adapter   
    }
}
