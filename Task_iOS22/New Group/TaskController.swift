//
//  TaskController.swift
//  Task_iOS22
//
//  Created by Ivan Ramirez on 10/10/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    
    // Singleton
    static let shared = TaskController()
    
    // Source of Verdad
    var tasks: [Task] {
        do {
            try fetchResultsController.performFetch()
            guard let tasks = fetchResultsController.fetchedObjects else {return []}
            return tasks
        } catch {
            print("🚀 There was an error in \(#function); \(error); \(error.localizedDescription) 🚀")
            return []
        }
    }
    
    let fetchResultsController: NSFetchedResultsController <Task> = {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
    }()
    
    // MARK: - CRUD
    func add(taskWithName name: String, notes: String?, due: Date?){
        let _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStorage()
    }
    
    func udpate(task: Task, name: String, notes: String, due: Date?){
        task.due = due
        task.name = name
        task.notes = notes
        
        saveToPersistentStorage()
    }
    
    func remove(task: Task){
        guard let moc = task.managedObjectContext else {return}
        moc.delete(task)
        
        saveToPersistentStorage()
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
        
        saveToPersistentStorage()
    }
    
    // MARK: Persistent and Fetch
    func saveToPersistentStorage() {
        let moc = CoreDataStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("🚀 Saving to persistent had an error in \(#function); \(error); \(error.localizedDescription) 🚀")
        }
    }
}


