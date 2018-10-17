//
//  ButtonTableViewCell.swift
//  Task_iOS22
//
//  Created by Ivan Ramirez on 10/10/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit


class ButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    // NOTE: - Note sure if this is needed .  var Mytasks : Task?
    var mytask : Task?
    
    var delegate: ButtonTableViewCellDelegate?
    //var isComlete: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()
       updateText()
    }
    
    func updateButton( _ isComplete: Bool) {
        if isComplete {
            isCompleteButton.setImage(UIImage(named: "complete"), for: .normal)
        } else {
            isCompleteButton.setImage(UIImage(named: "incomplete"), for: .normal)
        }
        mytask?.isComplete = isComplete
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        delegate?.buttonCellButtonTapped(self)
    }
    
}

extension ButtonTableViewCell {
    func update(withTask task: Task){
      self.mytask = task
        nameLabel.text = task.name
        updateButton(task.isComplete)
    }
}

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}

