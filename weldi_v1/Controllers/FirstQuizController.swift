//
//  FirstQuizController.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 4/28/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//

import UIKit

class FirstQuizController: UIViewController {

    var quizModule: Quiz = Quiz.init()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func StartQuiz(_ sender: Any) {
   
        performSegue(withIdentifier: "startToQuiz", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "startToQuiz"){
         
            var seg = segue.destination as! QuizController
            seg.quizModule = self.quizModule
        }
    }
}
