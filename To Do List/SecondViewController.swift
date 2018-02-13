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
        let listObject = UserDefaults.standard.object(forKey: "todoList")
        
        if let array = listObject as? NSArray as? [String]{
            print(array)
            var updatedArray = array
            
            if let userInput = textField.text{
                let input = String(userInput)
               // print(input)
                updatedArray.append(input)
                UserDefaults.standard.set(updatedArray, forKey: "todoList")
            }
            
        }else{
            print(textField.text)
            
            if let userInput = textField.text{
                let input = String(userInput)
                var updatedArray = [input]
                UserDefaults.standard.set(updatedArray, forKey: "todoList")
                
            }

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

