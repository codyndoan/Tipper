//
//  ViewController.swift
//  Tipper
//
//  Created by Cody Doan on 12/11/16.
//  Copyright © 2016 CodyDoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var visualView: UIView!
    @IBOutlet weak var pplLabel: UILabel!
    @IBOutlet weak var pplStepper: UIStepper!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercent: UILabel!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBOutlet weak var totalLabelTitle: UILabel!
    @IBOutlet weak var tipLabelTitle: UILabel!
    
    var numPpl : Double = 1
    var bill : Double = 0
    var tip : Double = 0
    var total : Double = 0
    var percent : Double = 0
    let step : Float = 0.01
    var location : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tipper"
        location = visualView.center.y
        visualView.center.y = self.view.frame.height + 1000
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func darkBlur(bool: BooleanLiteralType) {
        if bool {
            blurView.effect = UIBlurEffect(style: .dark)
            tipLabelTitle.textColor = UIColor.white
            totalLabelTitle.textColor = UIColor.white
            pplStepper.tintColor = UIColor.white
        } else {
            blurView.effect = UIBlurEffect(style: .light)
            tipLabelTitle.textColor = UIColor.black
            totalLabelTitle.textColor = UIColor.black
            pplStepper.tintColor = UIColor.black
        }
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        //UIView.animate(withDuration: 1.0, delay: 3.0, usingSpringWithDamping: 2.0, initialSpringVelocity: 1.0, options: [], animations: ({
          //  self.visualView.center.y = self.view.frame.height + 1000
        //}), completion: nil)
    }

    //
    @IBAction func sliderChange(_ sender: Any) {
        let roundedValue = round(sliderValue.value / step) * step
        sliderValue.value = roundedValue
        percent = Double(sliderValue.value)
        tipPercent.text = String(format: "%.0f", (sliderValue.value*100)) + "%"
    }

    @IBAction func stepperChanged(_ sender: Any) {
        numPpl = pplStepper.value
        splitLabel.text = String(format: "$%.2f", total/numPpl)
        if numPpl != 1 {
            pplLabel.text = String(format: "%.0f friends", numPpl)
        } else {
            pplLabel.text = "me myself and i"
        }
    }
    
    @IBAction func selectTipControl(_ sender: Any) {
        let tipArray = [0.12, 0.15, 0.20]
        percent = tipArray[tipControl.selectedSegmentIndex]
        sliderValue.value = Float(percent)
        tipPercent.text = String(format: "%.0f", (sliderValue.value*100)) + "%"
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Animate Menu In Once User Starts editing
        if billField.text == "" {
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: [], animations: ({
                  self.visualView.center.y = self.view.frame.height + 1000
                }), completion: nil)
        } else {
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1.0 , initialSpringVelocity: 2.0, options: [], animations: ({
                self.visualView.center.y = self.location
            }), completion: nil)
        }
        bill = Double(billField.text!) ?? 0.0
        let roundedValue = round(sliderValue.value / step) * step
        percent = Double(roundedValue)
        tip = bill * percent
        total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        numPpl = pplStepper.value
        splitLabel.text = String(format: "$%.2f", total/numPpl)
    }
}

