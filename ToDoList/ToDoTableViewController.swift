//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Abhinav Shukla on 2017-08-17.
//  Copyright © 2017 Abhinav Shukla. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var toDoItems: [ToDoClass] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDoItems = createToDoItems()
    }
    
    //test function to display items on the To Do List view
    //this function creates and stores ToDoClass objects
    func createToDoItems() -> [ToDoClass]
    {
        let eggs = ToDoClass()
        eggs.itemName = "Buy Eggs"
        eggs.important = true
        
        let dog = ToDoClass()
        dog.itemName = "Walk the Dog"
        
        let dinner = ToDoClass()
        dinner.itemName = "Cook Dinner"
        
        
        return [eggs, dog, dinner]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDoDisplay = toDoItems[indexPath.row]
        
        if toDoDisplay.important
        {
            cell.textLabel?.text = "❗️" + toDoDisplay.itemName
        }
        
        else
        {
            cell.textLabel?.text = toDoDisplay.itemName
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addViewController = segue.destination as! AddToDoViewController
        
        addViewController.previousViewController = self
    }

}
