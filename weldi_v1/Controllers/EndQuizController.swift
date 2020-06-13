//
//  EndQuizController.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 4/28/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//

import UIKit

class EndQuizController: UIViewController {

    var quizModule: Quiz!
    
    @IBOutlet weak var correct: UILabel!
    @IBOutlet weak var incorrect: UILabel!
    @IBOutlet weak var tot: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settup()

        // Do any additional setup after loading the view.
    }
    
    func settup(){
        
        setCorrect()
        setInCorrect()
        setTotal()
    }
    
    func setCorrect(){
        correct.text = String(quizModule.giveCorrectCount())
    }
    func setInCorrect(){
        incorrect.text = String(quizModule.giveInCorrectCount())

    }
    func setTotal(){
        tot.text = String(quizModule.giveTotalQuestionCount())

    }


    

}
