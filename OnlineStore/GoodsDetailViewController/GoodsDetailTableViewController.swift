//
//  GoodsDetailTableViewController.swift
//  OnlineStore
//
//  Created by Denis Zayakin on 12/10/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class GoodsDetailTableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var sizeButton: UIButton!
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var pickerSubview: UIView!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    var choice: String?
    var slides: [Slide] = []
    var scrollingTimer: Timer?
    var selectedProduct: Product?
    
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
        
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentOffset = CGPoint(x: 0, y: 0)

        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        
        productNameLabel.text = selectedProduct?.name
       
        self.view.addSubview(pageControl)
        self.view.bringSubviewToFront(pageControl)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollingTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.animateScrollView), userInfo: nil, repeats: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        scrollingTimer?.invalidate()
    }
    
    @IBAction func toCartVC(_ sender: Any) {
        self.performSegue(withIdentifier: "toCartViewController", sender: nil)
    }
    
    func createSlides() -> [Slide] {
        
        let slide1: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageView.image = UIImage(named: "1")
        
        let slide2: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageView.image = UIImage(named: "2")
        
        let slide3: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imageView.image = UIImage(named: "3")
        
        return [slide1, slide2, slide3]
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: -150, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    @objc func animateScrollView() {
        let scrollWidth = scrollView.bounds.width
        let currentXOffset = scrollView.contentOffset.x
        
        let lastXPos = currentXOffset + scrollWidth
        if lastXPos != scrollView.contentSize.width {
            scrollView.setContentOffset(CGPoint(x: lastXPos, y: 0), animated: true)
        }
        else {
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
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
    
    @IBAction func addToCartButtonTapped(_ sender: Any) {
        DataSource.shared.addToCart(product: selectedProduct!)
        print((selectedProduct?.name)! + " added to cart")
    }
}
