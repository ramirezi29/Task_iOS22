//
//  DateHelper.swift
//  Task_iOS22
//
//  Created by Ivan Ramirez on 10/11/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import Foundation

extension Date {
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
}
