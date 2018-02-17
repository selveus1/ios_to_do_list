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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        cell.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
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
        self.todoTable.backgroundColor = UIColor.blue
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let listObject = UserDefaults.standard.object(forKey: "todoList")
        if let array = listObject as? NSArray as? [String]{
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

