//
//  QuizParentChild.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 6/28/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//

import UIKit
import Alamofire
import Reachability
class quizParentCell: UITableViewCell
{
    @IBOutlet weak var answerParentQuizLabel: UILabel!
}


class QuizParentChild: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var AnswerTable: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    var quizParentAnswerList = ["answer 1","answer 2","answer 3","answer 4"]
    var answerCheck = "nothing"
    private var questionList:[QuestionParent] = []

    private var currentQuestion: Int = 0
    private var correctCount: Int = 0
    private var inCorrectCount: Int = 0
    var reachability: Reachability?

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            self.reachability = try Reachability.init()
            
        }catch {
            print ("Enable to start notifier")
        }
        
        if ((reachability!.connection)  != .unavailable)
        {
            
            let encodeUrl = apiGetQuiz
            
            let requestofUrl = Alamofire.request(apiGetQuiz, method: .get, encoding: JSONEncoding.default, headers: nil)
            
            requestofUrl.responseJSON { (response) in
                let json = response.value as! NSArray
                let id = json.value(forKey:"id") as! Array<Any>
                let QUESTION = json.value(forKey:"QUESTION") as! Array<Any>
                let C1 = json.value(forKey:"C1") as! Array<Any>
                let C2 = json.value(forKey:"C2") as! Array<Any>
                let C3 = json.value(forKey:"C3") as! Array<Any>
                let C4 = json.value(forKey:"C4") as! Array<Any>
                let answer = json.value(forKey:"Answer") as! Array<Any>
                print (response.request!)
                print (response.result )
                print (response.response!)
                print (response.value!)
                
                switch response.result {
                    
                case .success(let payload) :
                    var j = 0
                    let i = 2
                    while (j < Int(i))  {
                        let question = QuestionParent(idd: id[j] as! Int, question: QUESTION[j]as! String, answer: answer[j]as! String, choice1: C1[j] as! String, choice2: C2[j] as! String, choice3: C3[j] as! String, choice4: C4[j] as! String)
                        self.questionList.append(question)
                        j += 1
                    }
                    
                    
                    print (self.questionList.count)
                    print (self.questionList[0])
                    
                case .failure(_):
                    let alert = UIAlertController(title: "", message:"no connection", preferredStyle: .alert)
                    let closeAction = UIAlertAction(title: "close", style: UIAlertAction.Style.cancel, handler: {action in print ("close")
                        
                    })
                    alert.addAction(closeAction)
                    self.present(alert,animated: true,completion: nil)
                }
            }
            
            
            
        }else
        {
            let alert = UIAlertController(title: "", message: "Internet required", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "close", style: UIAlertAction.Style.cancel, handler: {action in print ("close")
                
            })
            alert.addAction(closeAction)
            self.present(alert,animated: true,completion: nil)
            
            
        }
        AnswerTable.delegate = self
        AnswerTable.dataSource = self
        setstup(check: true)

    }
 
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizParentAnswerList.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "quizCell") as! quizCell
        cell.answerLabel.text = quizParentAnswerList[indexPath.row]
        return cell
    }
    
    @IBAction func submitAction(_ sender: Any) {
    }
    
    
    ///////////

    /////////////
    
    func setChoices(){
        
        quizParentAnswerList = GiveCurrentQuestion().giveChoices()
        answerCheck = quizParentAnswerList[0]
        
    }
    func setQuestion(){
        questionLabel.text = GiveCurrentQuestion().giveQuestion()
    }
    
    func setCount(){
        
        var temp = ""
        temp.append(String(giveCurrentQuestionValue()))
        temp.append("/")
        temp.append(String(giveTotalQuestionCount()))
        questionNumberLabel.text = temp
        
    }
    func chooseAnswer(){
        InputAnswer(input: GiveCurrentQuestion().checkAnswer(input: answerCheck))
        setstup(check: moveToNextQuestion())
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "QuizToEnd"){
//            var seg = segue.destination as! EndQuizController
//            seg.quizModule = self.quizModule
//        }
//    }
  
    func setstup(check: Bool) {
        if(check){
          
            setCount()
            setQuestion()
            setChoices()
            AnswerTable.reloadData()
            
        }else {
            performSegue(withIdentifier: "QuizToEnd", sender: nil)
        }
        
    }
    func apicalling ()
    {
        do {
            self.reachability = try Reachability.init()
            
        }catch {
            print ("Enable to start notifier")
        }
        
        if ((reachability!.connection)  != .unavailable)
        {
            
            let encodeUrl = apiGetQuiz
            
            let requestofUrl = Alamofire.request(apiGetQuiz, method: .get, encoding: JSONEncoding.default, headers: nil)
            
            requestofUrl.responseJSON { (response) in
                let json = response.value as! NSArray
                let id = json.value(forKey:"id") as! Array<Any>
                let QUESTION = json.value(forKey:"QUESTION") as! Array<Any>
                let C1 = json.value(forKey:"C1") as! Array<Any>
                let C2 = json.value(forKey:"C2") as! Array<Any>
                let C3 = json.value(forKey:"C3") as! Array<Any>
                let C4 = json.value(forKey:"C4") as! Array<Any>
                let answer = json.value(forKey:"Answer") as! Array<Any>
                print (response.request!)
                print (response.result )
                print (response.response!)
                print (response.value!)
                
                switch response.result {
                    
                case .success(let payload) :
                    var j = 0
                    let i = 2
                    while (j < Int(i))  {
                        let question = QuestionParent(idd: id[j] as! Int, question: QUESTION[j]as! String, answer: answer[j]as! String, choice1: C1[j] as! String, choice2: C2[j] as! String, choice3: C3[j] as! String, choice4: C4[j] as! String)
                        self.questionList.append(question)
                        j += 1
                    }
                    
                    
                    print (self.questionList.count)
                    print (self.questionList[0])
                    
                case .failure(_):
                    let alert = UIAlertController(title: "", message:"no connection", preferredStyle: .alert)
                    let closeAction = UIAlertAction(title: "close", style: UIAlertAction.Style.cancel, handler: {action in print ("close")
                        
                    })
                    alert.addAction(closeAction)
                    self.present(alert,animated: true,completion: nil)
                }
            }
            
            
            
        }else
        {
            let alert = UIAlertController(title: "", message: "Internet required", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "close", style: UIAlertAction.Style.cancel, handler: {action in print ("close")
                
            })
            alert.addAction(closeAction)
            self.present(alert,animated: true,completion: nil)
            
            
        }
        
        
    }
    func GiveCurrentQuestion () -> QuestionParent {
        return questionList[0]
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
