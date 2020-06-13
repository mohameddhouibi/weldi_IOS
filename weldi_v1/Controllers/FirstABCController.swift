//
//  FirstABCController.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 4/30/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//

import UIKit

class FirstABCController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnStartAction(_ sender: Any) {
        performSegue(withIdentifier: "StartABC", sender: nil)
        }
}
