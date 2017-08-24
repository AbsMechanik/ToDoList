//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Abhinav Shukla on 2017-08-17.
//  Copyright © 2017 Abhinav Shukla. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var toDoItems: [ToDoCoreData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    
    func getToDos()
    {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            
           if let coreDataToDos = try? context.fetch(ToDoCoreData.fetchRequest()) as? [ToDoCoreData]
           {
            if let theToDos = coreDataToDos
            {
                toDoItems = theToDos
                tableView.reloadData()
            }
            
            }
            
        }
    }
    
/*    //test function to display items on the To Do List view
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
*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDoDisplay = toDoItems[indexPath.row]
        
        if let name = toDoDisplay.itemName
        {
            if toDoDisplay.important
            {
                cell.textLabel?.text = "❗️" + name
            }
            else
            {
                cell.textLabel?.text = toDoDisplay.itemName
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let toDoDisplay = toDoItems[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDoDisplay)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addViewController = segue.destination as? AddToDoViewController
        {
            addViewController.previousViewController = self
        }
        
        if let completeViewController = segue.destination as? CompleteToDoItemViewController
        {
            if let toDoSender = sender as? ToDoCoreData
            {
                completeViewController.selectedToDoItem = toDoSender
                completeViewController.previousViewController = self
            }
        }

    }

}
