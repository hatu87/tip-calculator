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
        calculatorModel = TipsCalculatorModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private var calculatorModel: TipsCalculatorModel!
    
    @IBAction func onBills_BeginEditing(sender: AnyObject) {
        calculatorModel.tipsPercentage = 0.1
        
        if let text: String = txtBills.text {
            if let bills = Float(text) {
                let result = calculatorModel.calculateTips(bills)
                
                lblResult.text = String(format: "%.2f", result)
            }
            

        }

    }
}
