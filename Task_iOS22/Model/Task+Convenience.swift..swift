//
//  Task+Convenience.swift..swift
//  Task_iOS22
//
//  Created by Ivan Ramirez on 10/10/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    @discardableResult
    
    convenience init(name: String, notes: String?, due: Date?, context: NSManagedObjectContext = CoreDataStack.managedObjectContext) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.due = due
    }
}

//extension Task {
// var dateAsString: String {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .none
//        formatter.timeStyle = .short
//    return formatter.string(from: due ?? Date())
//    }
//}
