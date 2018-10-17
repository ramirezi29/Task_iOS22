//
//  TaskDetailTableViewController.swift
//  Task_iOS22
//
//  Created by Ivan Ramirez on 10/10/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    var myTask: Task? {
        didSet{
            updateViews()
        }
    }
    
    var dueDateValue : Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDateTextField.inputView = dueDatePicker
        updateViews()
        TaskDetailUI()
    }
    
    
    
    func updateViews() {
        if isViewLoaded{
            nameTextField.text = myTask?.name
            noteTextView.text = myTask?.notes
            dueDateTextField.text = dueDateValue?.stringValue()
        }
    }
    // MARK: - Action
    //ame: String, notes: String?, due: Date?,
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else {return}
        if let task = myTask {
            TaskController.shared.udpate(task: task, name: name, notes: noteTextView.text, due: dueDateValue)
        } else {
            TaskController.shared.add(taskWithName: name, notes: noteTextView.text, due: dueDateValue)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // NOTE - Choose UIDatePicker as the sender type so that you do not need to cast the object to get the date off of it
    //Implement the action to store the updated date value to dueDateValue and to set the taskDueTextField.text to the string value from the date picker's date
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueDateValue = sender.date
        dueDateTextField.text = sender.date.stringValue()
    }
    
    @IBAction func userTappedView(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        dueDateTextField.resignFirstResponder()
        noteTextView.resignFirstResponder()
    }
    
}

extension TaskDetailTableViewController {
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
        cell.backgroundColor = UIColor(white: 0, alpha: 0.0)
        nameTextField.backgroundColor = UIColor(white: 0, alpha: 0.0)
        dueDateTextField.backgroundColor = UIColor(white: 0, alpha: 0.0)
        dueDatePicker.backgroundColor = UIColor(white: 0, alpha: 0.0)
        noteTextView.backgroundColor = UIColor(white: 0, alpha: 0.0)
    }
}


