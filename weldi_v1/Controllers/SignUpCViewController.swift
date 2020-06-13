//
//  SignUpCViewController.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 4/21/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//



import UIKit
import Reachability
import MBProgressHUD
import Alamofire

class SignUpCViewController: UIViewController {
    @IBOutlet weak var nametxt: UITextField!
    
    @IBOutlet weak var AgeTxt: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var preferences: UITextField!
   
    
    var reachability:Reachability?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
   
    @IBAction func view(_ sender: Any) {
    }
    
  
    @IBAction func create(_ sender: Any) {
        
        
        
        if nametxt.text! != "" && password.text! != ""
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
            var parent:Int
            parent = UserDefaults.standard.integer(forKey: "user_id")
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
            
            let params = [
                "name":self.nametxt.text!.trimmingCharacters(in:.whitespacesAndNewlines) as AnyObject,
                "password":self.password.text!.trimmingCharacters(in:.whitespacesAndNewlines) as AnyObject,
                "parent_id": parent as AnyObject ]
            
            let encodeUrl = apiSignupChild
            
            let requestofUrl = Alamofire.request(encodeUrl, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil)
            
            requestofUrl.responseJSON { (response) in
                
                
                print (response.request!)
                print (response.result )
                print (response.response!)
                
                switch response.result {
                    
                case .success(_) :
                    
                    MBProgressHUD.hide(for: self.view , animated: true)
                    
                    self.performSegue(withIdentifier: "viewlistChild", sender: self)

                    
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

