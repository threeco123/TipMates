//
//  ViewController.swift
//  tipster
//
//  Created by James De Angelis on 17/01/2015.
//  Copyright (c) 2015 James De Angelis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var personTwoLabel: UILabel!
    @IBOutlet weak var personThreeLabel: UILabel!
    @IBOutlet weak var personFourLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        personTwoLabel.text = "$0.00"
        personThreeLabel.text = "$0.00"
        personFourLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var twoPeople = total / 2
        var threePeople = total / 3
        var fourPeople = total / 4
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        personTwoLabel.text = String(format: "$%.2f", twoPeople)
        personThreeLabel.text = String(format: "$%.2f", threePeople)
        personFourLabel.text = String(format: "$%.2f", fourPeople)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

 