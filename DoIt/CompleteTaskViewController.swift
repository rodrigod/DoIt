//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Rodrigo Diaz on 3/11/18.
//  Copyright © 2018 Rodrigo Diaz. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    @IBOutlet weak var taskName: UILabel!

    
    var task: Task? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        if task!.important {
            taskName.text = "❗️\(task!.name!)"
        } else {
            taskName.text  = task!.name!
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
        
    }
    
}
