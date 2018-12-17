//
//  CompleteToDoViewController.swift
//  ToDoApp
//
//  Created by David D on 12/15/18.
//  Copyright © 2018 David D. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {
    var toDoListViewController = ToDoTableViewController()
    var selectedToDoItem: ToDoEntity? = nil
    
    @IBOutlet weak var toDoTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set view's title label text to selected item's name
        toDoTitleLabel.text = selectedToDoItem?.name
    }
    
    @IBAction func completeButtonTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let todoItem = selectedToDoItem {
                context.delete(todoItem)
                try? context.save()
                navigationController?.popViewController(animated: true)
            }
        }
        
        /*
         ## UI deletion ##
        var index = 0
        // remove item from list on todo list view controller
        // loop through array and find matching item to remove
        for todo in toDoListViewController.toDoList {
            if (todo.name == selectedToDoItem.name) {
                // remove item at this index
                toDoListViewController.toDoList.remove(at: index)
                // reload table view
                toDoListViewController.tableView.reloadData()
                // go back to previous view by popping this view controller from stack
                navigationController?.popViewController(animated: true)
                break
            }
            index += 1
        }
        */
    }
}
