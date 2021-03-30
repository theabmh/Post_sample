//
//  ViewController.swift
//  Post_trial_3
//
//  Created by iroid on 30/03/21.
//  Copyright © 2021 iroid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    
    
//    parameters:
//
//    name
//
//    address
//
//    dob
//
//    mobile
//
//    offer_price
//
//    country
//
//    email
//
//    password
//
    @IBOutlet var NameTxt: UITextField!
    
    
    
    @IBOutlet var Addtxt: UITextField!
    
    @IBOutlet var DobTxt: UITextField!
    
    @IBOutlet var mobTxt: UITextField!
    
    
    @IBOutlet var offertxt: UITextField!
    
    
    @IBOutlet var countryTxt: UITextField!
    
    @IBOutlet var emailtxt: UITextField!
    
    
    @IBOutlet var passTxt: UITextField!
    
    let getdata = NSMutableData()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func SignUP(_ sender: Any) {
        
        var UrlReq = URLRequest(url: URL(string:"http://iroidtechnologies.in/Manichain/index.php/Manichain_cntrl/register")!)
        UrlReq.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
        UrlReq.httpMethod = "post"
        
        let PostStr = ("name=\(NameTxt.text!)&address=\(Addtxt.text!)&dob=\(DobTxt.text!)&mobile=\(mobTxt.text!)&offer_price=\(offertxt.text!)&country=\(countryTxt.text!)&email=\(emailtxt.text!)&password=\(passTxt.text!)")
        UrlReq.httpBody = PostStr.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: UrlReq){(data,request,error) in
            
            if let Mydata = data{
                
                print ("MyData>>>>>>>\(Mydata)")
                
                do{
                    self.getdata.append(Mydata)
                    
                    let Jsondata = try JSONSerialization.jsonObject(with: self.getdata as Data, options: [])
                    print("jsondata >>>>>>",Jsondata)
                    
                    DispatchQueue.main.async {
                        let storybrd = UIStoryboard(name: "Main", bundle: nil)
                        let loGin = storybrd.instantiateViewController(withIdentifier: "login") as! loginVC
                        self.navigationController?.pushViewController(loGin, animated: true)
                    }
                    
                }
                
                catch{
                    print(error.localizedDescription)
                }
                
            }
        }
        task.resume()
        
        
    }
    
    @IBAction func SignIN(_ sender: Any) {
        
        let storybrd = UIStoryboard(name: "Main", bundle: nil)
        let loGin = storybrd.instantiateViewController(withIdentifier: "login") as! loginVC
        self.navigationController?.pushViewController(loGin, animated: true)
    }
    

}

