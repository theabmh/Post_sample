//
//  loginVC.swift
//  Post_trial_3
//
//  Created by iroid on 30/03/21.
//  Copyright © 2021 iroid. All rights reserved.
//

import UIKit

class loginVC: UIViewController {
    
    @IBOutlet var UnTxt: UITextField!
    
    
    @IBOutlet var PswTXt: UITextField!
    
    
    @IBOutlet var signinBtn: UIButton!
    
    let getdata = NSMutableData()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signinbutton(_ sender: Any) {
        var UrlReq = URLRequest(url: URL(string:"http://iroidtechnologies.in/Manichain/index.php/Manichain_cntrl/login")!)
        UrlReq.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
        UrlReq.httpMethod = "post"
        
        let POST_str = ("email=\(UnTxt!.text!)&password=\(PswTXt!.text!)")
        
        print("postStr >>>>>>>>",POST_str)
        
        UrlReq.httpBody = POST_str.data(using: .utf8)
        
        let Task = URLSession.shared.dataTask(with: UrlReq)
        {(data,request,error) in
            
            if let mydata = data {
                
                print("mydata >>>>>>>>\(mydata)")
                
                do {
                    
                    self.getdata.append(mydata)
                    
                    let jsonData = try JSONSerialization.jsonObject(with: self.getdata as Data, options: [])
                    
                    print("jsondata>>>>\(jsonData)")
                    
                    
                }
                catch{
                    print("error",error.localizedDescription)
                }
            }
            
            
        }
        Task.resume()
        
    }
}
    

