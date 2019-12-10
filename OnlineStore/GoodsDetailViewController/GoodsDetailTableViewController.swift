//
//  GoodsDetailTableViewController.swift
//  OnlineStore
//
//  Created by Denis Zayakin on 12/10/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class GoodsDetailTableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var sizeButton: UIButton!
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var pickerSubview: UIView!
    @IBOutlet weak var picker: UIPickerView!
    
    var choice: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        picker.selectRow(0, inComponent: 0, animated: true)
        pickerSubview.layer.cornerRadius = 5
        pickerSubview.layer.borderWidth = 1
        pickerSubview.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        sizeButton.layer.cornerRadius = 5
        colorButton.layer.cornerRadius = 5
        choice = DataSource.shared.picker[0]
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //MARK: PickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DataSource.shared.picker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return DataSource.shared.picker[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        choice = DataSource.shared.picker[row]
    }
    
    @IBAction func pickerDoneButton(_ sender: Any) {
        picker.resignFirstResponder()
        colorButton.setTitle(choice,for: .normal)
        self.pickerSubview.isHidden = true
    }
    
    @IBAction func colorSelectButton(_ sender: Any) {
        pickerSubview.isHidden = false
    }
    
    @IBAction func sizeSelectButton(_ sender: Any) {
    }
    
}
