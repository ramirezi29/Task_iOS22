//
//  TaskListTableViewController.swift
//  Task_iOS22
//
//  Created by Ivan Ramirez on 10/10/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit
import CoreData

// NOTE: Delegate, I am now da' Boss 💪🏾
class TaskListTableViewController: UITableViewController, ButtonTableViewCellDelegate {
    
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell) {
        guard let task = sender.mytask else {return}
        TaskController.shared.toggleIsCompleteFor(task: task)
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TaskListUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
     override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My Tasks"
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.shared.tasks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? ButtonTableViewCell else {return UITableViewCell()}
        let task = TaskController.shared.tasks[indexPath.row]
        
        cell.update(withTask: task)
        cell.delegate = self 
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = TaskController.shared.tasks[indexPath.row]
            TaskController.shared.remove(task: task)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let destinationVC = segue.destination as? TaskDetailTableViewController,
                let indexPath = tableView.indexPathForSelectedRow else {return}
            let taskIndex = TaskController.shared.tasks[indexPath.row]
            destinationVC.myTask = taskIndex
            // NOTE: - You will also want to pass the due property from your selected task to the dueDateValue property in your TaskDetailTableViewController
            destinationVC.dueDateValue = taskIndex.due
        }
    }
}

extension TaskListTableViewController {
    
    // Custom Background and UI
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let clearColor = UIColor.clear
        cell.backgroundColor = UIColor(white: 0, alpha: 0.0)
        cell.textLabel?.backgroundColor = clearColor
        
    }
}
