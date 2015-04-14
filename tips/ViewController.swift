//
//  ViewController.swift
//  tips
//
//  Created by Rohit Bhoompally on 4/13/15.
//  Copyright (c) 2015 Rohit Bhoompally. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let selectedSegmentIndex = "SelectedSegmentIndex"
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialization.
        tipLabel.text = "$0.00";
        totalLabel.text = "$0.00"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // Get the default selected segment index from NSUserDefaults and set it here.
        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue = defaults.integerForKey(selectedSegmentIndex)
        tipControl.selectedSegmentIndex = intValue
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        updateFields()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateFields()
    }
    
    func updateFields() {
        var tipPercentages = [0.15, 0.18, 0.20];
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmt = (billField.text as NSString).doubleValue;
        var tipAmt = billAmt * tipPercentage;
        var totalAmt = billAmt + tipAmt;
        tipLabel.text = "$\(tipAmt)";
        totalLabel.text = "$\(totalAmt)";
        
        tipLabel.text = String(format: "%.2f", tipAmt)
        totalLabel.text = String(format: "%.2f", totalAmt)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

