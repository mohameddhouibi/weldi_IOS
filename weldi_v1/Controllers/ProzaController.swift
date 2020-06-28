//
//  ProzaController.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 6/28/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//

import UIKit
import Alamofire
import Reachability

class ProzaController: UIViewController {
    public var questionList:[QuestionParent] = []
    public var questionListaa:[QuestionParent] = []


    var reachability: Reachability?


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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apicalling ()
        
        print (self.questionList.count)
    }

}
