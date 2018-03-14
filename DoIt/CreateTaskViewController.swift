//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Rodrigo Diaz on 3/10/18.
//  Copyright © 2018 Rodrigo Diaz. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    var previousViewController = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func addTapped(_ sender: Any) {
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        previousViewController.tasks.append(task)
        previousViewController.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    


}
