//
//  GoodsTableViewCell.swift
//  OnlineStore
//
//  Created by Denis Zayakin on 12/6/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class GoodsCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 1.5
        self.layer.borderWidth = 1
        self.layer.masksToBounds = true
    }
}
