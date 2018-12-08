//
//  UIAlertControllerExtentions.swift
//  Habitual
//
//  Created by Stephen Ouyang on 12/8/18.
//  Copyright © 2018 Stephen Ouyang. All rights reserved.
//

import Foundation
import UIKit.UIAlert

extension UIAlertController {
    convenience init(habitTitle: String, comfirmHandler: @escaping () -> Void) {
        self.init(title: "Delete Habit", message: "Are you sure you want to delete \(habitTitle)?", preferredStyle: .actionSheet)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .destructive) { _ in
            comfirmHandler()
        }
        self.addAction(confirmAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        self.addAction(cancelAction)
    }
}
