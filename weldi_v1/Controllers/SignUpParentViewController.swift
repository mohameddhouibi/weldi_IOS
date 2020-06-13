//
//  SignUpParentViewController.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 4/14/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//

import UIKit
import Reachability
import MBProgressHUD
import Alamofire


class SignUpParentViewController: UIViewController {

    
    @IBOutlet weak var UserName: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var PasswordVerif: UITextField!
    
    
    var reachability:Reachability?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignInAction(_ sender: Any) {
   
        
        if UserName.text! != "" && Email.text! != "" && Password.text! != ""
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
    
    @IBAction func actionn(_ sender: Any) {
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
            "name":self.UserName.text!.trimmingCharacters(in:.whitespacesAndNewlines) as AnyObject,
            "email":self.Email.text!.trimmingCharacters(in:.whitespacesAndNewlines) as AnyObject,
            "password":self.Password.text!.trimmingCharacters(in:.whitespacesAndNewlines) as AnyObject,
            "passwordverif":self.PasswordVerif.text!.trimmingCharacters(in:.whitespacesAndNewlines) as AnyObject
            ]
            let encodeUrl = apiSignup
            
            let requestofUrl = Alamofire.request(encodeUrl, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil)
            
            requestofUrl.responseJSON { (response) in
                
                
                print (response.request!)
                print (response.result )
                print (response.response!)
                
                switch response.result {
                    
                case .success(_) :
                    
                    MBProgressHUD.hide(for: self.view , animated: true)
                   
                    
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
