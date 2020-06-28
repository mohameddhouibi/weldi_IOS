//
//  QuestionParent.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 6/28/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//

import Foundation

class QuestionParent {
    private var id: Int

    private var question: String 
    private var answer: String
    private var choice1: String
    private var choice2: String
    private var choice3: String
    private var choice4: String
    
    init (idd: Int, question: String, answer: String, choice1: String, choice2: String, choice3: String, choice4: String)
    {
        self.id = idd
        self.question = question
        self.answer = answer
        self.choice1 = choice1
        self.choice2 = choice2
        self.choice3 = choice3
        self.choice4 = choice4
        
    }
    func giveChoices() -> [String]{
        
        var temp: [String] = []
        temp.append(choice1)
        temp.append(choice2)
        temp.append(choice3)
        temp.append(choice4)
        return temp
    }
    
    func checkAnswer(input: String) -> Bool {
        
        if (answer == input){
            return true
        }
        else {
            
            return false
        }
        
    }
    
    func giveQuestion() -> String {
        
        return question
    }

}
