//
//  Question.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 4/28/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//

import Foundation

class Question {
    private var question: String
    private var answer: String
    private var choice1: String
    private var choice2: String
    private var choice3: String
    private var choice4: String

    init(){
        question="jawk behi ?"
        answer="jey"
        choice1="jaw"
        choice2="jey"
        choice3="w"
        choice4="beh"
    }
    init (que: String, an: String, c1: String, c2: String, c3: String, c4: String)
        {
        question = que
        answer = an
        choice1 = c1
        choice2 = c2
        choice3 = c3
        choice4 = c4
        
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
