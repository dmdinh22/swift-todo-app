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
    var selectedToDoItem = ToDo()
    
    @IBOutlet weak var toDoTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set view's title label text to selected item's name
        toDoTitleLabel.text = selectedToDoItem.name
    }
    
    @IBAction func completeButtonTapped(_ sender: Any) {
        // remove item from list on todo list view controller
        // loop through array and find matching item to remove
        
    }
}
