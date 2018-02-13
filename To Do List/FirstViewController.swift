//
//  FirstViewController.swift
//  To Do List
//
//  Created by Athena on 2/12/18.
//  Copyright © 2018 Sheena Elveus. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var numRows = 0
    var todos = [String]()
    @IBOutlet weak var todoTable: UITableView!
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return numRows
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        if numRows > 0{
            cell.textLabel?.text = String( todos[indexPath.row] )
        }else{
            cell.textLabel?.text = String( "" )
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            print("removing \(indexPath.row)")
            if numRows > 0{
                todos.remove(at: indexPath.row)
                numRows = todos.count
                UserDefaults.standard.set(todos, forKey: "todoList")
                todoTable.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let listObject = UserDefaults.standard.object(forKey: "todoList")
//        if let array = listObject as? NSArray as? [String]{
//            print("in viewDidLoad --> \(array) ")
//            numRows = array.count
//            todos = array
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let listObject = UserDefaults.standard.object(forKey: "todoList")
        if let array = listObject as? NSArray as? [String]{
            print("in viewDidAppear --> \(array) ")
            numRows = array.count
            todos = array
            todoTable.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

