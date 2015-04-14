//
//  SettingsViewController.swift
//  tips
//
//  Created by Rohit Bhoompally on 4/13/15.
//  Copyright (c) 2015 Rohit Bhoompally. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    let selectedSegmentIndex = "SelectedSegmentIndex"
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue = defaults.integerForKey(selectedSegmentIndex)
        defaultTipControl.selectedSegmentIndex = intValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDefaultTipChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipControl.selectedSegmentIndex, forKey: selectedSegmentIndex)
        defaults.synchronize()
    }
    @IBAction func onDoneClick(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
