//
//  ViewController.swift
//  tips-calculator
//
//  Created by Anh-Tu Hoang on 11/2/15.
//  Copyright © 2015 hatu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblPercentage: UILabel!
    @IBOutlet weak var slrPercentage: UISlider!
    @IBOutlet weak var txtBills: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // load tip default
        loadAmount()
    }

    override func viewWillAppear(animated: Bool) {
        calculatorModel = TipsCalculatorModel()
        loadDefauts()
        

    }
    
    override func viewWillDisappear(animated: Bool) {
        saveAmount()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func loadDefauts(){
        let defaults = NSUserDefaults.standardUserDefaults()
        let percent = defaults.floatForKey("tip")
        
        setTipPercentage(percent)
    }
    
    private func loadAmount(){
        let defaults = NSUserDefaults.standardUserDefaults()
        let bills = defaults.floatForKey("amount")
        
        txtBills.text = bills.description
        //onBills_BeginEditing(txtBills)
    }
    
    private func saveAmount(){
        if let text: String = txtBills.text {
            if let bills = Float(text) {
                
                let defaults = NSUserDefaults.standardUserDefaults()
                defaults.setFloat(bills, forKey: "amount")
                defaults.synchronize()

            }
        }


    }
    
    
    private func setTipPercentage(percent: Float){
        calculatorModel.tipsPercentage = percent
        slrPercentage.value = percent
        lblPercentage.text = String(format:"%d%%", Int(percent * 100))
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setFloat(percent, forKey: "tip")
        defaults.synchronize()

    }
    
    
    
    private var calculatorModel: TipsCalculatorModel!
    
    @IBAction func onBills_BeginEditing(sender: AnyObject) {
        if let text: String = txtBills.text {
            if let bills = Float(text) {
                let result = calculatorModel.calculateTips(bills)
                
                lblResult.text = String(format: "%.2f", result)
            }else{
                lblResult.text = "0"
            }
        }
    }
    
    @IBAction func onScreen_Tap(sender: AnyObject) {
        txtBills.endEditing(true)
    }
    @IBAction func onPercentage_Editing(sender: AnyObject) {
        let percent = round(slrPercentage.value * 10) / 10
        
        setTipPercentage(percent)
        
        onBills_BeginEditing(sender)
    }
}
