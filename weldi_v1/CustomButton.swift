//
//  CustomButton.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 4/14/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//

import UIKit

class CustomButtom: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRadius()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setRadius()
    }
    
    func setRadius(){
        layer.cornerRadius = 20
    }
}
