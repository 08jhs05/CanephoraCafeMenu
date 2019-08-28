//
//  FirstScreenViewController.swift
//  CanephoraMenu
//
//  Created by Jae Ho Shin on 2019-08-26.
//  Copyright © 2019 Jay Shin. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func openMenu(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toMainMenu", sender: self)
    }
    
    @IBAction func modifyMenu(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Not Supported", message: "Menu modifier will be added soon!", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
