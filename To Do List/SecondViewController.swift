//
//  SecondViewController.swift
//  To Do List
//
//  Created by Athena on 2/12/18.
//  Copyright © 2018 Sheena Elveus. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addBtnPressed(_ sender: Any) {
        let itemsObject = UserDefaults.standard.object(forKey: "todoList")
        var input = ""
        
        if let userInput = textField.text{
            input = String(userInput)
        }
        
        if var array = itemsObject as? NSArray as? [String]{
            //if let userInput = textField.text{
            //    let input = String(userInput)
                array.append(input)
                UserDefaults.standard.set(array, forKey: "todoList")
            //}
        }else{
            //if let userInput = textField.text{
             //   let input = String(userInput)
                UserDefaults.standard.set([input], forKey: "todoList")
            //}
        }
        
        textField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

