//
//  ViewController.swift
//  tips-calculator
//
//  Created by Anh-Tu Hoang on 11/2/15.
//  Copyright © 2015 hatu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtBills: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onBills_BeginEditing(sender: AnyObject) {
        
        if let text: String = txtBills.text {
            if let bills = Float(text) {
                let result = bills * 1.1
                
                lblResult.text = String(format: "%.2f", result)
            }
            

        }

    }
}
