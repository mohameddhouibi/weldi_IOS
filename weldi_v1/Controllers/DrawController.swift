//
//  DrawController.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 4/30/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//

import UIKit




class DrawController: UIViewController {

    let canvas = Canvas()
    let undoButton: UIButton =
    {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(hanleUndo), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func hanleUndo ()
    {
        canvas.undo()
    }
    
    let ClearButton: UIButton =
    {
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)

        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(hanleClear), for: .touchUpInside)

        return button
    }()
    
    
    @objc fileprivate func hanleClear ()
    {
        canvas.clear()
    }
    let YellowButton: UIButton =
    {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        button.layer.borderWidth = 1
        
        button.addTarget(self, action: #selector(hanleColorChange), for: .touchUpInside)
        
        return button
    }()
    let RedButton: UIButton =
    {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.layer.borderWidth = 1
        
          button.addTarget(self, action: #selector(hanleColorChange), for: .touchUpInside)
        
        return button
    }()
    let BlueButton: UIButton =
    {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.borderWidth = 1
        
           button.addTarget(self, action: #selector(hanleColorChange), for: .touchUpInside)
        
        return button
    }()
    
    @objc fileprivate func hanleColorChange (Button: UIButton)
    {
        canvas.setStrokeColor(color: Button.backgroundColor ?? .black)
    }
    
    let slider: UISlider = {
       let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(hanleSliderChange), for: .touchUpInside)

        return slider
        
    }()
    
    @objc fileprivate func hanleSliderChange ()
    {
        canvas.setStrokeWidth(width: slider.value)
    }
    
    
    
    override func loadView() {
        self.view = canvas
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvas.backgroundColor = .white
        let Colorsstackview = UIStackView(arrangedSubviews: [
            YellowButton,
            RedButton,
            BlueButton
            ])
        Colorsstackview.distribution = .fillEqually
        Colorsstackview.frame = CGRect(x: 0, y: 0, width: 180, height: 30)
        let stackview = UIStackView(arrangedSubviews: [
            undoButton,
            ClearButton,
            Colorsstackview,
            slider,
            ])
        stackview.spacing = 10
        stackview.distribution = .fillEqually
        stackview.frame = CGRect(x: 0, y: 30, width: 350, height: 40)
        view.addSubview(stackview)
        

        //setupLayout()

    }
    
//    fileprivate func setupLayout() {
//        let stackview = UIStackView(arrangedSubviews: [
//            undoButton,
//            ClearButton
//            ])
//        stackview.distribution = .fillEqually
//        view.addSubview(stackview)
//        stackview.translatesAutoresizingMaskIntoConstraints = true
//        stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        stackview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//
//    }
    
 
    

}
