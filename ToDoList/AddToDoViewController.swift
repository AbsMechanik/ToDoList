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
 /*
        let toDo = ToDoClass()
        //handling the special case where itemNameTextField
        //returns a nil when the Optional is unwrapped
        if let itemNameUnwrapped = itemNameTextField.text
        {
            toDo.itemName = itemNameUnwrapped
            toDo.important = importantSwitch.isOn
            
            previousViewController.toDoItems.append(toDo)
            previousViewController.tableView.reloadData()
            
            navigationController?.popViewController(animated: true)
        }
*/
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
            
            if let itemNameUnwrapped = itemNameTextField.text
            {
                toDo.itemName = itemNameUnwrapped
                toDo.important = importantSwitch.isOn
            }
            
            try? context.save()
            navigationController?.popViewController(animated: true)
            
        }
    }
}
