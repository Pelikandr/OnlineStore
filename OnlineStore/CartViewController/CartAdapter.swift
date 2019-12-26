//
//  CartAdapter.swift
//  OnlineStore
//
//  Created by Denis Zayakin on 12/10/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import Foundation
import UIKit

class CartAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSource.shared.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        cell.textLabel?.text = DataSource.shared.cart[indexPath.row].name
        return cell
    }
}
