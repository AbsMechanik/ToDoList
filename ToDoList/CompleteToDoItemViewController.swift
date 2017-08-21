//
//  CompleteToDoItemViewController.swift
//  ToDoList
//
//  Created by Abhinav Shukla on 2017-08-20.
//  Copyright © 2017 Abhinav Shukla. All rights reserved.
//

import UIKit

class CompleteToDoItemViewController: UIViewController {
    
    var previousViewController = ToDoTableViewController()
    var selectedToDoItem = ToDoClass()
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemNameLabel.text = selectedToDoItem.itemName
    }
    @IBAction func completeTapped(_ sender: Any)
    {
        var index = 0
        
        for items in previousViewController.toDoItems
        {
            if items.itemName == selectedToDoItem.itemName
            {
                previousViewController.toDoItems.remove(at: index)
                previousViewController.tableView.reloadData()
                navigationController?.popViewController(animated: true)
                
                break;
            }
            index += 1
        }
    }
    
}
