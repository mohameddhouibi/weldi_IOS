//
//  QuizParentQViewController.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 6/26/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//

import UIKit
import Reachability
import MBProgressHUD
import Alamofire
class QuizParentQViewController: UIViewController {

    
    @IBOutlet weak var Quetion: UITextField!
    @IBOutlet weak var C1: UITextField!
    @IBOutlet weak var C2: UITextField!
    @IBOutlet weak var C3: UITextField!
    @IBOutlet weak var C4: UITextField!
    

    var reachability:Reachability?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func addQuiz(_ sender: UIButton) {
            apiCalling ()
    }
    
    
    func apiCalling ()
    {
        do {
            self.reachability = try Reachability.init()
            
        }catch {
            print ("Enable to start notifier")
        }
        
        if ((reachability!.connection)  != .unavailable)
        {
            var parent:Int
            parent = UserDefaults.standard.integer(forKey: "user_id")
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
            
            let params = [
                "QUESTION":self.Quetion.text!.trimmingCharacters(in:.whitespacesAndNewlines) as AnyObject,
                "C1":self.C1.text!.trimmingCharacters(in:.whitespacesAndNewlines) as AnyObject
                ,
                "C2":self.C2.text!.trimmingCharacters(in:.whitespacesAndNewlines) as AnyObject,
                
                "C3":self.C3.text!.trimmingCharacters(in:.whitespacesAndNewlines) as AnyObject
                ,
                "C4":self.C4.text!.trimmingCharacters(in:.whitespacesAndNewlines) as AnyObject,
                "Answer": parent as AnyObject ]
            
            let encodeUrl = apiAddQuiz
            
            let requestofUrl = Alamofire.request(encodeUrl, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil)
            
            requestofUrl.responseJSON { (response) in
                
                
                print (response.request!)
                print (response.result )
                print (response.response!)
                
                switch response.result {
                    
                case .success(_) :
                    
                    MBProgressHUD.hide(for: self.view , animated: true)
                    
                    let alert = UIAlertController(title: "Questions", message:"Success", preferredStyle: .alert)
                    let closeAction = UIAlertAction(title: "close", style: UIAlertAction.Style.cancel, handler: {action in print ("close")
                        
                    })
                    alert.addAction(closeAction)
                    self.present(alert,animated: true,completion: nil)
                    
                    
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
    
}
