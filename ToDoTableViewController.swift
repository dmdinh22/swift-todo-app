//
//  ToDoTableViewController.swift
//  ToDoApp
//
//  Created by David D on 12/14/18.
//  Copyright © 2018 David D. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    var toDoList: [ToDoEntity] = []
    
    // lifecycle hook on first render of view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getToDos()
    }
    
    // lifecycle hook before a view gets rendered
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    
    func getToDos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            // fetch data from Core Data - as array of ToDoEntity
            if let coreDataToDos = try? context.fetch(ToDoEntity.fetchRequest()) as? [ToDoEntity] {
                if let todoItems = coreDataToDos {
                    toDoList = todoItems
                    tableView.reloadData()
                }
            }
        }
    }
    
    func createToDos() -> [ToDo] {
        let eggs = ToDo()
        eggs.name = "Buy Eggs"
        
        let gas = ToDo()
        gas.name = "Get Gas"
        gas.isImportant = true
        
        let dog = ToDo()
        dog.name = "Walk the dog"
        
        return [eggs, gas, dog]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoViewIdentifier", for: indexPath)
        //                  passing in the row for each index
        let toDo = toDoList[indexPath.row]
        
        // use if-let to unwrap optional
        if let name = toDo.name {
            if toDo.isImportant {
                cell.textLabel?.text = "❗️" + name
            } else {
                cell.textLabel?.text = toDo.name
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDoList[indexPath.row]
        performSegue(withIdentifier: "transitionToComplete", sender: toDo)
    }
    
    // called right before a segue between views happen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addViewController = segue.destination as? AddToDoViewController {
            // set the property of AddToDoViewController to this ToDoTableViewController
            addViewController.toDoListViewController = self
        }
        
        if let completeViewController = segue.destination as? CompleteToDoViewController {
            if let todo = sender as? ToDo {
                // set view controller's prop as selected todo item
                completeViewController.selectedToDoItem = todo
                completeViewController.toDoListViewController = self
            }
        }
    }
}
