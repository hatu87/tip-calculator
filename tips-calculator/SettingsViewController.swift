//
//  SettingsViewController.swift
//  tips-calculator
//
//  Created by Anh-Tu Hoang on 11/2/15.
//  Copyright © 2015 hatu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = NSUserDefaults.standardUserDefaults()
        let percent = defaults.floatForKey("tip")
        setTipPercentage(percent)
    }

    override func viewWillAppear(animated: Bool) {
    
    }
    
    private func setTipPercentage(percent: Float){
        slrDefaultPercentage.value = percent
        lblPercentage.text = String(format:"%d%%", Int(percent * 100))
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setFloat(percent, forKey: "tip")
        defaults.synchronize()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var slrDefaultPercentage: UISlider!

    @IBOutlet weak var lblPercentage: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onDefaultPercentage_Changing(sender: AnyObject) {
        let percent = round(slrDefaultPercentage.value * 10) / 10
        
        setTipPercentage(percent)
    }

}
