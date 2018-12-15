//
//  ToDoTableViewController.swift
//  ToDoApp
//
//  Created by David D on 12/14/18.
//  Copyright © 2018 David D. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    var toDoList: [ToDo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDoList = createToDos()
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
        
        if toDo.isImportant {
            cell.textLabel?.text = "❗️" + toDo.name
        } else {
            cell.textLabel?.text = toDo.name
        }

        return cell
    }
    
    // called right before a segue between views happen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addViewController = segue.destination as! AddToDoViewController
        
        // set the property of AddToDoViewController to this ToDoTableViewController
        addViewController.toDoListViewController = self
    }
}
