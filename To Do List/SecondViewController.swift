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
    @IBOutlet weak var warningLabel: UILabel!
    
    @IBAction func addBtnPressed(_ sender: Any) {
        let itemsObject = UserDefaults.standard.object(forKey: "todoList")
        let input = String(textField.text!)
        var array=[String]()
        
        if input.isEmpty{
            warningLabel.text = "Please enter an item."
        }else{
            warningLabel.text = ""
            if var tempArray = itemsObject as? NSArray as? [String]{
                array = tempArray
            }
            array.append(input)
            UserDefaults.standard.set(array, forKey: "todoList")
            textField.text = ""
        }
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

