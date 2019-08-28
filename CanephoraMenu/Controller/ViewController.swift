//
//  ViewController.swift
//  CanephoraMenu
//
//  Created by Jae Ho Shin on 2019-08-06.
//  Copyright © 2019 Jay Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollMenu: UIScrollView!
    @IBOutlet weak var categories: UIStackView!
    @IBOutlet weak var firstMenuView: UIStackView!
    @IBOutlet weak var currentTimeText: UILabel!
    
    @IBOutlet weak var categoryButton1: UIButton!
    @IBOutlet weak var categoryButton2: UIButton!
    @IBOutlet weak var categoryButton3: UIButton!
    @IBOutlet weak var CategoryButton4: UIButton!
    @IBOutlet weak var CategoryButton5: UIButton!
    @IBOutlet weak var CategoryButton6: UIButton!
    
    @IBOutlet weak var scrollBtn1: UIButton!
    @IBOutlet weak var scrollBtn2: UIButton!
    @IBOutlet weak var scrollBtn3: UIButton!
    @IBOutlet weak var scrollBtn4: UIButton!
    @IBOutlet weak var scrollBtn5: UIButton!
    @IBOutlet weak var scrollBtn6: UIButton!
    
    @IBOutlet weak var opaqueFilter: UIView!
    @IBOutlet weak var itemBoxContainer: UIView!
    @IBOutlet weak var itemBoxTitle: UILabel!
    @IBOutlet weak var itemBoxPrice: UILabel!
    @IBOutlet weak var itemBoxImage: UIImageView!
    
    var scrollBtns: [UIButton] = []
    
    var timer = Timer()
    var currentMenu: Int = 0
    
    let myMenuData = menuData()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        giveCategoryNames()
        
        scrollBtns = [scrollBtn1, scrollBtn1, scrollBtn2, scrollBtn3, scrollBtn4, scrollBtn5, scrollBtn6]
        
        scrollMenu.isHidden = true
        categories.isHidden = true
        opaqueFilter.isHidden = true
        currentMenu = 0
        
        getCurrentTime()
        scheduledTimerWithTimeInterval()
    }

    @IBAction func firstMenuPressed(_ sender: UIButton) {
        
        currentMenu = sender.tag
        firstMenuView.isHidden = true
        scrollMenu.isHidden = false
        categories.isHidden = false
        
        createScrollMenu()
    }
    
    @IBAction func backToFistMenu(_ sender: UIButton) {
        
        firstMenuView.isHidden = false
        scrollMenu.isHidden = true
        categories.isHidden = true
        scrollMenu.setContentOffset(CGPoint(x:0.0, y:0.0), animated: false)
        setBackScrollMenu()
        currentMenu = 0
        
    }
    
    @IBAction func scrollMenuItemSelected(_ sender: UIButton) {
        
        opaqueFilter.isHidden = false
        categories.isUserInteractionEnabled = false
        scrollMenu.isUserInteractionEnabled = false
        
        itemBoxTitle.text = myMenuData.menuText[currentMenu][sender.tag]
        itemBoxImage.image = UIImage(named: myMenuData.menuText[currentMenu][sender.tag])
        
        switch currentMenu {
        case 1, 2:
            itemBoxPrice.text = "S: $\(myMenuData.menuPrice[currentMenu][sender.tag*2 - 2]) L: $\(myMenuData.menuPrice[currentMenu][sender.tag*2 - 1])"
        default:
            itemBoxPrice.text = "$\(myMenuData.menuPrice[currentMenu][sender.tag - 1])"
        }
        
        //setBackScrollMenu()
    }
    
    @IBAction func categoryPressed(_ sender: UIButton) {
        
        scrollMenu.setContentOffset(CGPoint(x:0.0, y:0.0), animated: false)
        setBackScrollMenu()
        currentMenu = sender.tag
        createScrollMenu()
        
    }
    
    @IBAction func itemXbuttonPressed(_ sender: UIButton) {
        
        opaqueFilter.isHidden = true
        categories.isUserInteractionEnabled = true
        scrollMenu.isUserInteractionEnabled = true
        
    }
    
    func getCurrentTime(){
        let currentDateTime = Date()
        let formatter = DateFormatter()
        
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        
        currentTimeText.text = formatter.string(from: currentDateTime)
    }
    
    func createScrollMenu(){
        for menuElement in 1...(myMenuData.menuText[currentMenu].count - 1){
            
            scrollBtns[menuElement].isHidden = false
            scrollBtns[menuElement].setTitle(myMenuData.menuText[currentMenu][menuElement], for: .normal)
            scrollBtns[menuElement].setBackgroundImage(UIImage(named: myMenuData.menuText[currentMenu][menuElement]), for: .normal)
            
        }
    }
    
    func setBackScrollMenu(){
        for btn in 0...(scrollBtns.count-1){
            scrollBtns[btn].setTitle("", for: .normal)
            scrollBtns[btn].setBackgroundImage(nil, for: .normal)
        }
    }
    
    func giveCategoryNames(){
        categoryButton1.setTitle(myMenuData.menuText[1][0], for: .normal)
        categoryButton2.setTitle(myMenuData.menuText[2][0], for: .normal)
        categoryButton3.setTitle(myMenuData.menuText[3][0], for: .normal)
        CategoryButton4.setTitle(myMenuData.menuText[4][0], for: .normal)
        CategoryButton5.setTitle(myMenuData.menuText[5][0], for: .normal)
        CategoryButton6.setTitle(myMenuData.menuText[6][0], for: .normal)
    }
    
    func scheduledTimerWithTimeInterval(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounting(){
        getCurrentTime()
    }
}

