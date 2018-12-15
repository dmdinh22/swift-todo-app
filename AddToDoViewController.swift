//
//  AddToDoViewController.swift
//  ToDoApp
//
//  Created by David D on 12/15/18.
//  Copyright © 2018 David D. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    var toDoListViewController = ToDoTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addBtnTapped(_ sender: Any) {
        // create ToDo object with data from view
        let todoItem = ToDo()
        todoItem.name = titleTextField.text! // optional because text may be nil
        todoItem.isImportant = importantSwitch.isOn
        
        toDoListViewController.toDoList.append(todoItem)
        
        // re-render once there has been changes made
        toDoListViewController.tableView.reloadData()
        
        // move back to previous view - popping navigation stack
        navigationController?.popViewController(animated: true)
    }
    
}
