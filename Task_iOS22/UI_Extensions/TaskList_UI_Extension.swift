//
//  TaskList_UI_Extension.swift
//  Task_iOS22
//
//  Created by Ivan Ramirez on 10/11/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit

extension TaskListTableViewController {
    
    func TaskListUI() {
        let blueImage = UIImage(named: "blueWall")
        let imageView = UIImageView(image: blueImage)
        tableView.backgroundView = imageView
        imageView.contentMode = .scaleAspectFill
        
//        let blurEffect = UIBlurEffect(style: .light)
//        let blurView = UIVisualEffectView(effect: blurEffect)
//        blurView.frame = imageView.bounds
//        imageView.addSubview(blurView)
//        imageView.clipsToBounds = true
    }
}
