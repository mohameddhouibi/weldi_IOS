//
//  SignIncController.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 4/21/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//

import UIKit
import Reachability
import MBProgressHUD
import Alamofire

class SignIncController: UIViewController {

    
    @IBOutlet weak var nametxt: UITextField!
    
    @IBOutlet weak var passwordtxt: UITextField!
      var reachability:Reachability?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginchild(_ sender: Any) {
        
        
        
        if nametxt.text! != "" && passwordtxt.text! != ""
        {
            
            apicalling ()
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
    
    
    func apicalling ()
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
                
                "name":self.nametxt.text!.trimmingCharacters(in:.whitespacesAndNewlines) as AnyObject,
                "password":self.passwordtxt.text!.trimmingCharacters(in:.whitespacesAndNewlines) as AnyObject,
                ]
            let encodeUrl = apiSigninChild
            
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
                        let id_child = resultValue["id_child"] as! Int
                        print (id_child)
                        UserDefaults.standard.set(id_child, forKey: "id_child")
                        self.performSegue(withIdentifier:
                            "<#String#>", sender: self)
                  
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
