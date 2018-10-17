//
//  ButtonCell_UI_Extension.swift
//  Task_iOS22
//
//  Created by Ivan Ramirez on 10/11/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit

extension ButtonTableViewCell {
    func updateText() {
        nameLabel.backgroundColor = UIColor(white: 0, alpha: 0.0)
        nameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        nameLabel.textColor = UIColor.white
    }
}
