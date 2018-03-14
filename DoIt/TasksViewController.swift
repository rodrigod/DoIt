//
//  TasksViewController.swift
//  DoIt
//
//  Created by Rodrigo Diaz on 3/10/18.
//  Copyright © 2018 Rodrigo Diaz. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var tasks: [Task] = []
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = initTasks()
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"

        } else {
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let task = tasks[selectedIndex]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    func initTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Math Homework"
        task1.important = true
        
        let task2 = Task()
        task2.name = "Wash Dishes"
        task2.important = false
        
        let task3 = Task()
        task3.name = "Fix Washing Machine"
        task3.important = true
        
        return [task1, task2, task3]
    }

    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addSegue" ) {
        let nextVC = segue.destination as! CreateTaskViewController
        nextVC.previousViewController = self
        } else if (segue.identifier == "selectTaskSegue" ) {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousViewController = self
        }
    }
}

