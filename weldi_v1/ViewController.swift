//
//  ViewController.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 4/14/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//

import UIKit
import Reachability
import MBProgressHUD
import Alamofire


class ViewController: UIViewController {

    
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var password: UITextField!
    var reachability:Reachability?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func SignInAction(_ sender: Any) {
    
        
        if Email.text! != "" && password.text! != ""
        {
            //api
            apiCalling ()
        }
        else
        {
            let alert = UIAlertController(title: "", message: "All Field are required", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "close", style: UIAlertAction.Style.cancel, handler: {action in print ("close")
                
            })
            alert.addAction(closeAction)
            self.present(alert,animated: true,completion: nil)
        }
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
            
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
            
            let params = [
             
                "email":self.Email.text!.trimmingCharacters(in:.whitespacesAndNewlines) as AnyObject,
                "password":self.password.text!.trimmingCharacters(in:.whitespacesAndNewlines) as AnyObject,
            ]
            let encodeUrl = apiSignin
            
            let requestofUrl = Alamofire.request(encodeUrl, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil)
            
            requestofUrl.responseJSON { (response) in
                
                
                print (response.request!)
                print (response.result )
                print (response.response!)
                
                switch response.result {
                    
                case .success(let payload) :
                    
                    MBProgressHUD.hide(for: self.view , animated: true)
                     if let x = payload as? Dictionary<String,AnyObject>
                    {
                        print (x)
                        let resultValue = x as NSDictionary
                        let user_id = resultValue["id"] as! Int
                        print (user_id)
                        UserDefaults.standard.set(user_id, forKey: "user_id")
                        self.performSegue(withIdentifier: "loginseg", sender: self)
//                        let mainstoryboard:UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
//                        let nextViewController = mainstoryboard.instantiateViewController(withIdentifier: "HomeParent") as! HomeParentController
//                        self.navigationController?.pushViewController(nextViewController, animated: true)
                    }

                    
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

