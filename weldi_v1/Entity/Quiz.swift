//
//  Quiz.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 4/28/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//

import Foundation

class  Quiz{
    private var questionList:[Question]
    private var currentQuestion: Int
    private var correctCount: Int
    private var inCorrectCount: Int
    
    init() {
        currentQuestion = 0
        correctCount = 0
        inCorrectCount = 0
        questionList = [Question.init(que: "2+2", an: "4", c1: "2", c2: "3", c3: "4", c4: "7"),Question.init(que: "3+3", an: "6", c1: "1", c2: "4", c3: "6", c4: "7"),Question.init(que: "7+1", an: "8", c1: "8", c2: "1", c3: "7", c4: "5"),Question.init(que: "6-3", an: "3", c1: "4", c2: "1", c3: "0", c4: "2"),Question.init(que: "2+1", an: "3", c1: "3", c2: "5", c3: "9", c4: "21")]
    }
    func GiveCurrentQuestion () -> Question {
    
        return questionList[currentQuestion]
    }
    func InputAnswer(input: Bool) {
        
        if (input){
            
            correctCount += 1
            
        }else{
            inCorrectCount += 1
        }
        
    }
    func moveToNextQuestion()->Bool{
        if (currentQuestion == questionList.count - 1)
        {
            return false
        }
        else {
            currentQuestion += 1
            return true
        }
        
    }
    func giveTotalQuestionCount () -> Int {
        return questionList.count
    }
    func giveCurrentQuestionValue () -> Int {
        
        return (currentQuestion + 1)
    }
    
    func giveCorrectCount() -> Int {
        
        return correctCount
    }
    func giveInCorrectCount() -> Int {
        
        return inCorrectCount
    }
    
    func reset(){
        currentQuestion = 0
        inCorrectCount = 0
        correctCount = 0
    }
    
}


