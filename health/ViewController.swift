//
//  ViewController.swift
//  health
//
//  Created by Philip George on 01/11/17.
//  Copyright © 2017 Philip George. All rights reserved.
//

import UIKit
import FirebaseDatabase



class ViewController: UIViewController {

    var bmi = ""
    var a = 0.00
    var ref:DatabaseReference!

    @IBOutlet weak var username: UITextField!
    
    @IBAction func user(_ sender: Any) {
    }
    @IBOutlet weak var desc: UILabel!
    
    @IBAction func go(_ sender: Any) {
        //var desc = ""
        
        ref = Database.database().reference().child("users").child(username.text!)
        ref.queryOrdered(byChild: "BMI").observe(.value, with:
            { snapshot in
                
                if snapshot.exists()
                {
                    let value = snapshot.value as? NSDictionary
                    //self.password = value?["PASS"] as? String ?? ""
                    //print(self.password)
                    self.bmi = value?["BMI"] as? String ?? ""
                    //self.name = value?["NAME"] as? String ?? ""
                    //var a = value?["CREDIT"]
                    //bal = value?["CREDIT"] as? String ?? ""
                    print(self.bmi)
                    self.out.text = ("BMI: \(self.bmi)")
                    //self.bmi
                    //print(value?["CREDIT"] as? Double ?? "")
                    
                    self.a = Double((self.bmi as NSString).floatValue)
                    
                    if self.a < 18.50
                    {
                        self.desc.text = "You are UNDERWEIGHT"
                    }
                    else if self.a > 18.50 && self.a < 24.99
                    {
                        self.desc.text = "You are HEALTHY"
                    }
                    else if self.a > 25.00 && self.a < 29.99
                    {
                        self.desc.text = "You are OVERWEIGHT"
                        
                    }
                    else if self.a > 30
                    {
                        self.desc.text = "You are OBESE"
                        
                    }
                    
                }
                else
                {
                    
                    print("does not exist")
                    //self.showerror(title: "ERROR", message: "ACCOUNT DOES NOT EXIST!")
                }
                
        })
        
    }
    
    @IBOutlet weak var out: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        username.returnKeyType = UIReturnKeyType.done
        out.text = "BMI:"
        username.autocorrectionType = UITextAutocorrectionType.no
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

