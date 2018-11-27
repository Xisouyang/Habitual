//
//  UIViewControllerExtensions.swift
//  Habitual
//
//  Created by Stephen Ouyang on 11/22/18.
//  Copyright © 2018 Stephen Ouyang. All rights reserved.
//

import UIKit

extension UIViewController {
    static func instantiate() -> Self {
    return self.init(nibName: String(describing: self), bundle: nil)
    }
}
