//
//  ListDetail.UI_Extension.swift
//  Task_iOS22
//
//  Created by Ivan Ramirez on 10/11/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit

extension TaskDetailTableViewController {
    
    func TaskDetailUI() {
        let blueImage = UIImage(named: "blueWall")
        let imageView = UIImageView(image: blueImage)
        tableView.backgroundView = imageView
        imageView.contentMode = .scaleAspectFill
        
        // NOTE: - This block of code makes the background all grey for some reason when testing on an actual iphone 
        //        let blurEffect = UIBlurEffect(style: .light)
        //        let blurView = UIVisualEffectView(effect: blurEffect)
        //        blurView.frame = imageView.bounds
        //        imageView.addSubview(blurView)
        //        imageView.clipsToBounds = true
        
        nameTextField.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        dueDateTextField.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        
    }
}

