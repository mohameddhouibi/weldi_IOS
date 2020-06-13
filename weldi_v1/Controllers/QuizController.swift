//
//  QuizController.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 4/28/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//


import UIKit

class quizCell: UITableViewCell
{
    @IBOutlet weak var answerLabel: UILabel!
    
    
}

class QuizController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var quizModule: Quiz!

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizAnswerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "quizCell") as! quizCell
        cell.answerLabel.text = quizAnswerList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        answerCheck = quizAnswerList[indexPath.row]
        
    }
    
    var answerCheck = "nothing"
    var quizAnswerList = ["answer 1","answer 2","answer 3","answer 4"]
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBAction func actionSubmit(_ sender: Any) {
    chooseAnswer()

    }
    @IBOutlet weak var quizTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizTable.delegate = self
        quizTable.dataSource = self
       

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        quizModule.reset()
        setstup(check: true)
    }
    
    func setstup(check: Bool) {
        if(check){
            
            setCount()
            setQuestion()
            setChoices()
            quizTable.reloadData()
            
        }else {
            performSegue(withIdentifier: "QuizToEnd", sender: nil)
        }
        
    }
    
    func setCount(){
        
        var temp = ""
        temp.append(String(quizModule.giveCurrentQuestionValue()))
        temp.append("/")
        temp.append(String(quizModule.giveTotalQuestionCount()))
        countLabel.text = temp
        
        
    }
    func setQuestion(){
        
        questionLabel.text = quizModule.GiveCurrentQuestion().giveQuestion()
    }
    
    func chooseAnswer(){
        quizModule.InputAnswer(input: quizModule.GiveCurrentQuestion().checkAnswer(input: answerCheck))
        setstup(check: quizModule.moveToNextQuestion()) 
    }
    
    func setChoices(){
        
        quizAnswerList = quizModule.GiveCurrentQuestion().giveChoices()
        answerCheck = quizAnswerList[0]
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "QuizToEnd"){
            var seg = segue.destination as! EndQuizController
            seg.quizModule = self.quizModule
        }
    }
    

}
