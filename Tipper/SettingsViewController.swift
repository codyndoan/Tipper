//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Cody Doan on 12/11/16.
//  Copyright © 2016 CodyDoan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var blurSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchAction(_ sender: Any) {
        let count = navigationController?.viewControllers.count;
        let viewCont : ViewController = navigationController?.viewControllers[count! - 2] as! ViewController
        let blurArray = [false, true]
        if blurArray[blurSegment.selectedSegmentIndex] {
            viewCont.darkBlur(bool: true)
        } else {
            viewCont.darkBlur(bool: false)
        }
    }

    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        viewController = segue.destinatonViewController
    }*/


}
