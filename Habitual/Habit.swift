//
//  Habit.swif.swift
//  Habitual
//
//  Created by Stephen Ouyang on 11/24/18.
//  Copyright © 2018 Stephen Ouyang. All rights reserved.
//

import Foundation
import UIKit

struct Habit {
    
    enum Images: Int, CaseIterable {
        case book
        case bulb
        case clock
        case code
        case drop
        case food
        case grow
        case gym
        case heart
        case lotus
        case other
        case pet
        case pill
        case search
        case sleep
        case tooth
        
        var image: UIImage {
            //checks to see if we actually have an image or not
            guard let image = UIImage(named: String(describing: self)) else {
                fatalError("image \(self) not found")
            }
            return image
        }
    }
    
    var selectedImage: Habit.Images
    var currentStreak = 0
    var bestStreak = 0
    var numberOfCompletions = 0
    
    let title: String
    let dateCreated: Date = Date()
    let lastCompletionDate: Date? = Date()

    var hasCompletedToday: Bool {
        return lastCompletionDate?.isToday ?? false
    }
    
    init(title: String, selectedImage: Habit.Images) {
        self.title = title
        self.selectedImage = selectedImage
    }
}
