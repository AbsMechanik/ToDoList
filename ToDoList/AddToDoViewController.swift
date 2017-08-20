//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by Abhinav Shukla on 2017-08-19.
//  Copyright © 2017 Abhinav Shukla. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController
{
    //link back to previous view controller, i.e. ToDoTableViewController
    var previousViewController = ToDoTableViewController()
    
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonTapped(_ sender: Any)
    {
        
        let toDo = ToDoClass()
        toDo.itemName = itemNameTextField.text!
        toDo.important = importantSwitch.isOn
        
        previousViewController.toDoItems.append(toDo)
        previousViewController.tableView.reloadData()
        
        navigationController?.popViewController(animated: true)
    }
}
