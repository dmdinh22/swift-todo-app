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
        /*
        // create ToDo object with data from view
        let todoItem = ToDo()
//        todoItem.name = titleTextField.text! // optional because text may be nil
        if let titleText = titleTextField.text {
            todoItem.name = titleText 
            todoItem.isImportant = importantSwitch.isOn
            
            toDoListViewController.toDoList.append(todoItem)
            
            // re-render once there has been changes made
            toDoListViewController.tableView.reloadData()
         
            navigationController?.popViewController(animated: true)
        }
 */
        //                gets the appDelegate for the view context
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

            let todoItem = ToDoEntity(entity: ToDoEntity.entity(), insertInto: context)
            
            // unwrapping the data from UI
            // no need to reload view because todo data will be coming from core data
            if let titleText = titleTextField.text {
                todoItem.name = titleText // constant from if-let
                todoItem.isImportant = importantSwitch.isOn
            }
            
            // save data to Core Data
            try? context.save()
            
            // move back to previous view - popping navigation stack
            navigationController?.popViewController(animated: true)
        }
    }
}
